---
title: The new Kubernetes Navigator
linkTitle: Touring the Kubernetes Navigator v2
weight: 22
---
## 1. The k8s cluster & cluster detail Pane

Go to the **Infrastructure** page in the Observability UI and select **Kubernetes**, this will offer you a number of Kubernetes services. For this exercise pick the `K8s cluster` pane.

![k8s-cluster-pane](../images/k8sclusters.png)

The first thing you notice is that the pane indicates how many clusters are being monitored for you. The pane also shows a tiny graph of the load being handled across those clusters for a birds eye view.  Lastly, if there is a alert for one of the clusters it will be highlighted here too.

Click or select on the pane  and you will be taken to the `Infrastructure/Kubernetes/ K8s clusters` overview pane. Here you will find a list off all the Kubernetes clusters that are sending data to the Splunk Observability Cloud platform.

### 1.1 Finding your K8s cluster name

Your first task is to identify and find your own cluster. The cluster will be named after your EC2 instance name: `ws-5-X-k3s-cluster` where `X` is the number of the EC2 instance assigned to you.

To find your node name look at the prompt of your EC2 instance, assuming you are assigned the 7th EC2 instance the prompt will show

``` bash
ubuntu@ws-5-7 ~ $
```

This means your cluster is named: `ws-5-7-k3s-cluster`  make a note as you will need this later in the workshop as a filter.

{{% alert title="Workshop Question" color="success" %}}
Find your Cluster in the Observability Kubernetes Navigator, and identify the number of containers that are running at this point.

**Tip:** You may need to switch  the Color By option to containers and refresh the screen a few times until the cluster data is correlated in the background. Also, it is recommended to set the timeframe to be `15m` (down from `3h` which is default).
{{% /alert %}}

### 1.2 Using the K8s Selection Pane

The K8s Selection Pane is a common pane used across most of the Navigator's and will offer you a list view of the  Services you are looking at. In this case it shows a list of all the active K8s Clusters.

You will find that this pane is used in all the navigators used in this workshop (Cluster's, Nodes, Workloads & Apache Servers). The way the selection pane works is similar across teh navigators. Just the focus and selection criteria will match the chosen service.

![k8s-cluster-list](../images/navi-selection-pane.png)

First, Select the `Memory usage (bytes)` from the **Color by** drop down box *Marked with a green line*, as shown in the example above.

Now,you can find your own Cluster by scrolling down the K8s cluster list or filter by using the field `k8s.cluster.name` in the filter toolbar, *(marked with a blue stripe)*.

You can enter a partial name into the search box such as 'ws-5-7', to find quickly find your Cluster. Also, its is a good idea to switch the default time from  the default 3 hours back to 15 minutes.

If there are many clusters, you can change the Result per page box *Marked by an orange line*,  to increase the list size.

You will note that each cluster row has a colored mark at the end of each row. These will change according the `color by` option, *Marked by a green line*, you have selected as to indicate its range.

These are the possible options for the k8s Cluster view:

![k8s-colorby-list](../images/Infk8sColorBy.png)

Next, you can change the the list view to a heat map view by selecting either the Heat map or List icon ![heat-map-toggle](../images/heatmaptoggle.png) *(Marked by a purple line).*

This will result in the follow representation:

![k8s-Heat-map](../images/heatmapview.png)

This might be a useful view if you have many cluster as they can be grouped together using the group by option *Marked by the green line* . The colors of each node will follow the color by  choice similar to the list view.

The last option, is the Find Outliers based on historical analytics of your clusters based on what is selected in the `colored by` box.  

This view is better used when you view all or a selection of you cluster (ar any other navigator view). It will give you a quick insight which of your clusters are behaving differently than  they do normally and may need further investigation.
You may not see relevant info, the clusters in this workshop are short lived and may haven't send enough meaningful data for the historical analytics to detect deviations.

### 1.3 The K8s cluster detail Pane

Initially,the cluster detail pane will show you the overall performance across all the servers as show below.

![k8s-allclusters](../images/k8s-allclusters.png)

As soon as you select your own cluster, you can see the overall performance of your Cluster, in this view you also can see if your cluster is affected by an alert:

![k8s-cluster-alert](../images/single-cluster-alert.png)

You may note that a `single alert` has fired for this example Cluster.

## 3. The Nodes & Workloads Panes

Go to the **Infrastructure** page in the Observability UI and select **Kubernetes**, this again will offer you a number of Kubernetes services. For this exercise pick the `K8s Nodes` pane. When selected it may show a cluster that you have selected previously.

![k8sNode](../images/k8sNodes.png)

{{% alert title="Note" color="info" %}}
When selected it may show a cluster that you have selected previously using the old UI. 

Check to see if there is a ![new-k8-button](../images/new-k8s-button.png) button on the top right... Press it to switch to the new UI.
{{% /alert %}}

In a production environment you would expect to see a large number of Clusters which would now all be visible and shown as individual pale blue squares, each containing green squares which represent pods, however in our workshop environment you each have a single node within your Cluster, represented by the large single blue square.

Drill down into the single Node by hovering over the pale blue background, then clicking on either the magnifying glass that appears in the top left corner, or double clicking on the pale blue background, this will take you to the Node level view.

You should now be able to see all the Pods and Containers running on your single Node Cluster...

![cluster-detail](../images/cluster-detail.png)

But, more importantly, the *side panel* should have also switched to the Info Tab and is now showing lots of contextual information about the Node.

![side-panel-node.png](../images/side-panel-node.png)

There are various Panes showing details on the Properties of the Node, and all the various Workloads running on it, even though we are still on the 'Map' tab within Kubernetes Navigator.

At the top of the side panel, click on the Expand icon ![expand-sidebar.png](../images/expand-sidebar.png) which takes you to the full screen tab of the currently displayed resource, which in this case is a Node, so we end up on the Node Details Tab.

Node Details shows you lots of great detail about what is happening on this Node, with charts for total CPU Usage, Memory Usage, Network traffic etc for all the Pods running on the Node with a list of any Events just to the right of these Charts.

You also have scrollable table views of both the Workloads and Containers running on the Node.  Clicking on any of the names in the tables will reopen the side panel with the appropriate panes for either Workloads or Containers.  Each of these can then also be expanded just like you did with the Node side panel, by clicking the expand button ![expand-sidebar.png](../images/expand-sidebar.png)

{{% alert title="Workshop Question" color="success" %}}
How much memory and how many CPU cores does our one node have?
{{% /alert %}}

## 3. Workloads & Workload Details Tabs

Assuming you have been able to answer the question about the Node CPU cores, you will now need to switch to the Workloads tab on the top toolbar.  The Workloads tab details all the workloads that are deployed within your cluster.

This table provides lots of valuable insights into the state of your workloads, and will show you if any of them are not in their desired state.

The default view has no Grouping applied but experiment with the various Group By options to see how the table changes.  Note how you can also use the various fields in the top toolbar to filter the data displayed, this would be essential in a large environment with hundreds or even thousands of different Workloads.

{{% alert title="Workshop Question" color="success" %}}
What type is the `splunk-otel-collector-agent` workload, and what is its desired configuration?
{{% /alert %}}

To get more detail on a specific Workload, simply click on its name in the Workload column (we assume you have the 'splunk-otel-collector-agent' workload selected), this will open the side panel, then click the expand button ![expand-sidebar.png](../images/expand-sidebar.png) to navigate to the Workload Detail Tab.

---

### 3.1 Workload Detail tab

Here you will get the general info about your Workload, the CPU and Memory the Containers are consuming, the Pods and their Phase, details of any Events, and finally a list of Pods related to this Workload.

As with the other Kubernetes Navigator views clicking on the name of a Pod within the table view will load the Side Panel with details about that resource, allowing you to 'click through' to these resources.  Select any of the listed Pods, then click the expand button ![expand-sidebar.png](../images/expand-sidebar.png) to navigate to the Pod Detail Tab.

{{% alert title="Workshop Question" color="success" %}}
How many containers does the `splunk-otel-collector-agent` Pod contain?
{{% /alert %}}

## 4. Pod Detail & Container Details Tabs

The last two Tabs that make up the Kubernetes Navigator are Pod Detail and Container Detail. The Pod Detail view will show you the Pod Properties, CPU, Memory and Network usage along with any events relevant to the Pod.

Clicking through to the Container Detail Tab, you should know how to do this by now, but just to play safe, select one of the Containers in the list then click the expand button ![expand-sidebar.png](../images/expand-sidebar.png) to navigate to the Container Detail Tab.  

If you navigated straight to the Container Detail Tab by simply clicking on the Tab, try using the Container ID drop down to select a container, now you will see the benefit of 'clicking through' to get to the desired Container!

You can now see the details for the Selected Container, with the Container Properties pane offering lots of detail on its configuration.
