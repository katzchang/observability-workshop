---
title: Pet Clinic Java Workshop
cascade:
  type: docs
description: >
  Introduction
---

The goal is to walk through the basic steps to configure the following components of the Splunk Observability platform:

* Splunk Infrastructure Monitoring (IM)
* Splunk Zero Configuration Auto Instrumentation for Java (APM)
  * Database Query Performance
  * AlwaysOn Profiling
* Splunk Real User Monitoring (RUM)
* Splunk LogsObserver (LO)

We will also show the steps about how to clone (download) a sample Java application (Spring PetClinic), as well as how to compile, package and run the application.

Once the application is up and running, we will instantly start seeing metrics and traces via the Zero Configuration Auto Instrumentation for Java that will be used by the Splunk APM product.

After that, we will instrument the PetClinic's end user interface (HTML pages rendered by the application) with the Splunk OpenTelemetry Javascript Libraries (RUM) that will generate RUM traces around all the individual clicks and page loads executed by an end user.

Lastly, we will configure the Spring PetClinic application to write application logs to the filesystem and also configure the Splunk OpenTelemetry Collector to read (tail) the logs and report to Splunk Observability Cloud.

{{% alert title="Prerequisites" %}}
A Splunk run workshop where an host/instance is provided  **OR** a self led workshop on own host / [multipass instance](https://github.com/splunk/observability-workshop/tree/main/multipass)

For your own system you will need the following installed and enabled:

1. Java installed
2. Port `8080` open inbound/outbound
{{% /alert %}}

![PetClinic Exercise](images/petclinic-exercise.png)
