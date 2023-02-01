---
title: Deploying PHP/Apache
linkTitle: Deploying PHP/Apache
weight: 3
---

## 1.  DNS and Services in Kubernetes

The Domain Name System (DNS) is a mechanism for linking various sorts of information with easy-to-remember names, such as IP addresses. Using a DNS system to translate request names into IP addresses makes it easy for end-users to reach their target domain name effortlessly.

Most Kubernetes clusters include an internal DNS service configured by default to offer a lightweight approach for service discovery. Even when Pods and Services are created, deleted, or shifted between nodes, built-in service discovery simplifies applications to identify and communicate with services on the Kubernetes clusters.

In short the DNS system for Kubernetes will create a DNS entry for each Pod and Service. In general a Pod has the following DNS resolution:

``` text
pod-name.my-namespace.pod.cluster-domain.example
```

For example, if a Pod in the `default` namespace has the Pod name `my_pod`, and the domain name for your cluster is `cluster.local`, then the Pod has a DNS name:

``` text
my_pod.default.pod.cluster.local
```

Any Pods exposed by a Service have the following DNS resolution available:

``` text
my_pod.service-name.my-namespace.svc.cluster-domain.example
```

More information can be found here : [DNS for Service and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)

## 2. Review OTel receiver for PHP/Apache

Inspect the YAML file `~/workshop/k3s/otel-apache.yaml` and validate the contents. This file contains the configuration for the OpenTelemetry agent to monitor the PHP/Apache deployment.

{{< tabpane >}}
{{< tab header="~/workshop/k3s/otel-apache.yaml" lang="yaml" >}}
agent:
  config:
    receivers:
      receiver_creator:
        receivers:
          smartagent/apache:
            rule: type == "port" && pod.name matches "apache" && port == 80
            config:
              type: collectd/apache
              url: http://php-apache-svc.apache.svc.cluster.local/server-status?auto

{{< /tab >}}
{{< /tabpane >}}

## 3.  Observation Rules in the OpenTelemetry config

The above file contains an observation rule for Apache using the OTel `receiver_creator`. This receiver can instantiate other receivers at runtime based on whether observed endpoints match a configured rule.

The configured rules will be evaluated for each endpoint discovered. If the rule evaluates to true then the receiver for that rule will be started as configured against the matched endpoint.

In the file above we tell the OpenTelemetry agent to look for Pods that match the name `apache` and have port `80` open. Once found, the agent will configure an Apache receiver to read Apache metrics from the configured URL. Note, the K8s DNS based URL in the above YAML for the service.

To use the Apache configuration, you can upgrade the existing Splunk OpenTelemetry Collector Helm chart to use the `otel-apache.yaml` file with the following command:

{{< tabpane >}}
{{< tab header="Helm Upgrade" lang="text" >}}
helm upgrade splunk-otel-collector \
--set="splunkObservability.realm=$REALM" \
--set="splunkObservability.accessToken=$ACCESS_TOKEN" \
--set="clusterName=$(hostname)-k3s-cluster" \
--set="splunkObservability.logsEnabled=true" \
--set="splunkObservability.infrastructureMonitoringEventsEnabled=true" \
splunk-otel-collector-chart/splunk-otel-collector \
--namespace splunk \
-f ~/workshop/k3s/splunk-defaults.yaml \
-f ~/workshop/k3s/otel-apache.yaml
{{< /tab >}}
{{< tab header="Helm Upgrade Single Line" lang="bash" >}}
helm upgrade splunk-otel-collector --set="splunkObservability.realm=$REALM" --set="splunkObservability.accessToken=$ACCESS_TOKEN" --set="clusterName=$(hostname)-k3s-cluster" --set="splunkObservability.logsEnabled=true" --set="clusterReceiver.eventsEnabled=true" --set="splunkObservability.infrastructureMonitoringEventsEnabled=true" splunk-otel-collector-chart/splunk-otel-collector --namespace splunk -f ~/workshop/k3s/splunk-defaults.yaml -f ~/workshop/k3s/otel-apache.yaml
{{< /tab >}}
{{< /tabpane >}}

{{% alert title="Note" color="info" %}}
The **REVISION** number of the deployment has changed (a way to keep track of your changes).

``` text
Release "splunk-otel-collector" has been upgraded. Happy Helming!
NAME: splunk-otel-collector
LAST DEPLOYED: Tue Jan 31 16:57:22 2023
NAMESPACE: splunk
STATUS: deployed
REVISION: 2
TEST SUITE: None
```

{{% /alert %}}

## 4. Kubernetes ConfigMaps

A ConfigMap is an object in Kubernetes consisting of key-value pairs which can be injected into your application. With a ConfigMap you can separate configuration from your Pods.

This way, you can prevent hardcoding configuration data. ConfigMaps are useful for storing and sharing non-sensitive, unencrypted configuration information.

The OpenTelemetry collector/agent uses ConfigMaps to store the configuration of the agent and the K8s Cluster receiver. You can/will always verify the current configuration of an agent after a change by running the following commands:

``` bash
kubectl get cm -n splunk
```

{{% alert title="Workshop Question" color="success" %}}
How many ConfigMaps are used by the collector?
{{% /alert %}}

When you have list of ConfigMaps from the namespace, select the one for the `otel-agent` and view it with the following command:

**Note:** The option `-o yaml` will print the content of the ConfigMap in a YAML format.

``` bash
kubectl get cm splunk-otel-collector-otel-agent -n splunk -o yaml
```

{{% alert title="Workshop Question" color="success" %}}
Is the content of `otel-apache.yaml` saved in the ConfigMap for the collector agent?
{{% /alert %}}

## 5. Review PHP/Apache deployment YAML

Inspect the YAML file `~/workshop/k3s/php-apache.yaml` and validate the contents. This file contains the configuration for the PHP/Apache deployment and will create a new StatefulSet with a single replica of the PHP/Apache image.

A stateless application is one that does not care which network it is using, and it does not need permanent storage. Examples of stateless apps may include web servers (Apache, Nginx, or Tomcat).

{{< tabpane >}}
{{< tab header="~/workshop/k3s/php-apache.yaml" lang="yaml" >}}
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: php-apache
spec:
  updateStrategy:
    type: RollingUpdate
  selector:
    matchLabels:
      run: php-apache
  replicas: 1
  template:
    metadata:
      labels:
        run: php-apache
    spec:
      containers:
      - name: php-apache
        image: ghcr.io/splunk/php-apache:latest
        ports:
        - containerPort: 80
        resources:
          limits:
            cpu: "8"
            memory: "9Mi"
          requests:
            cpu: "6"
            memory: "4Mi"

---
apiVersion: v1
kind: Service
metadata:
  name: php-apache-svc
  labels:
    run: php-apache
spec:
  ports:
  - port: 80
  selector:
    run: php-apache

{{< /tab >}}
{{< /tabpane >}}

## 6. Deploy PHP/Apache

Save the above file and deploy the PHP/Apache application to the cluster.

Create the `apache` namespace:

``` bash
kubectl create namespace apache
```

Deploy the PHP/Apache application:

``` bash
kubectl apply -f ~/workshop/k3s/php-apache.yaml -n apache
```

Ensure the deployment has been created:

``` bash
kubectl get statefulset -n apache
```

{{% alert title="Workshop Question" color="success" %}}
What metrics for your Apache instance are being reported in the Apache Dashboard?
{{% /alert %}}

{{% alert title="Workshop Question" color="success" %}}
Using the Observability Kubernetes Navigator, can you find the status of the `php-apache-0` pod in **Workload Detail**?

**HINT:** Filter by `k8s.cluster.name` to isolate your instance!
{{% /alert %}}

{{% alert title="Workshop Question" color="success" %}}
Where else has the issue with `php-apache` been logged? What is being reported?

**HINT:** Use `event.name = php-apache*` as **one** of your filters to isolate your instance!
{{% /alert %}}
