---
title: Example of RUM enablement in your Website
linkTitle:  Using RUM on your Website
weight: 1
---
* Check the original HEAD section of your Online-boutique webpage (or use the examples here) in your browser
* Find the Web address of your workshop hosts Online Boutique
* Compare the changes made to the hosts Online-Boutique and compare with the base one.

---

## 1. Review the original code of your NON RUM Online-Boutique

If you have access to an EC2 instance and have previously installed the Online Boutique as part of the APM session, you can view it on port 81 of the EC2 instance's IP address.

If you have not got access to an EC2 instance with the Online Boutique installed then your workshop instructor will provide you with the Online Boutique URL that does not have RUM installed so that you can complete the next steps.

## 2. Obtain RUM Access Token

As this Deployment we are about to do is also used as part of the RUM workshop section, you will need to obtain your RUM Access Token from the Splunk UI. You can find the workshop Access Token by clicking **>>** bottom left or the ![settings](../../images/setting.png) menu option and then selecting **Settings → Access Tokens**.

Expand the RUM workshop token that your host has instructed you to use e.g. **O11y-Workshop-RUM-TOKEN**, then click on **Show Token** to expose your token. Click the {{% labelbutton color="ui-button-grey" %}}Copy{{% /labelbutton %}} button to copy to clipboard. Please do not use the **Default** token! Make sure the token has RUM as its Authorization Scope.

![Access Token](../../../images/RUM-Access-Token.png)

{{% alert title="Please do not attempt to create your own token" color="warning" %}}
We have created a RUM Token specifically for this workshop with the appropriate settings for the exercises you will be performing
{{% /alert %}}

Create the `RUM_TOKEN` environment variable to use in the proceeding shell script to personalize your deployment.

{{< tabpane >}}
{{< tab header="Export Variables" lang="sh" >}}
export RUM_TOKEN=<replace_with_O11y-Workshop-RUM-TOKEN>
{{< /tab >}}
{{< /tabpane >}}

## 2. Deploy Online Boutique

To deploy the Online Boutique application into K3s, run the apm config script, then apply the deployment:

{{< tabpane >}}
{{< tab header="Deploy Online Boutique" lang="sh" >}}
cd ~/workshop/apm
./apm-config.sh -r
kubectl apply -f deployment.yaml
{{< /tab >}}
{{< tab header="Deployment Output" lang= "text" >}}
deployment.apps/checkoutservice created
service/checkoutservice created
deployment.apps/redis-cart created
service/redis-cart created
deployment.apps/productcatalogservice created
service/productcatalogservice created
deployment.apps/loadgenerator created
service/loadgenerator created
deployment.apps/frontend created
service/frontend created
service/frontend-external created
deployment.apps/paymentservice created
service/paymentservice created
deployment.apps/emailservice created
service/emailservice created
deployment.apps/adservice created
service/adservice created
deployment.apps/cartservice created
service/cartservice created
deployment.apps/recommendationservice created
service/recommendationservice created
deployment.apps/shippingservice created
service/shippingservice created
deployment.apps/currencyservice created
service/currencyservice created
{{< /tab >}}
{{< /tabpane >}}

{{% alert title="In case of a message about a VARIABLE being unset" color="warning" %}}
Please undeploy the APM environment by running **kubectl delete -f deployment.yaml**</br>
Before exporting the variable as described in the guide and rerunning the deployment script above.
{{% /alert %}}

Open your web browser and go to the Online Boutique.  (The one you previously used, or the one provided by the Workshop instructor). You will see the Non RUM Online Boutique running.

![Online Boutique](../../images/online-boutique.png)

Follow the instructions for your preferred browser below:

### 1.1 Chrome, FireFox  & Microsoft Edge Users - Check the Web page source

In Chrome & Firefox or Microsoft Edge you can right click on the Online-Boutique site, you will have an option to **"View Page Source"**

![Chrome-see-source](../../images/Chrome-1.png)

Selecting it will show you the HTML page source code in a separate Tab.

![Chrome-see-html](../../images/Chrome-html.png)

If successful you can skip to [2 -  Review the unchanged HEAD section.](../RUM-Setup/#2-review-the-unchanged-head-section)

### 1.2 Safari Users - Check the Web page source

For Safari users, you may have to enable the extra menu in Safari by selecting **'Preferences'** under *Safari* in the OS X menu bar.

![Safari-1](../../images/Safari-1.png)

Then in the dialog that pops up, under the **'Advanced'** pane select the checkbox that says **'Show Develop menu in menu bar. '**  and close the Dialog box.

![Safari-2](../../images/Safari-2.png)

You can now right click on the Online-Boutique and you now will have an option **'Show Page Source'**.

![Safari-3](../../images/Safari-3.png)

If you select that option on the Online-Boutique you will see the HTML source code as shown below:

![Safari-html](../../images/Safari-html.png)

If successful you can skip to [2 -  Review the unchanged HEAD section.](../RUM-Setup/#2-review-the-unchanged-head-section)

### 1.3 Internet Explorer Users - Check the Web page source

For Internet Explorer 11 Users, you may have trouble with this exercise as it will require a specific version of the Splunk Open Telemetry Javascript for Web/RUM.

However you will be able to see the changes required by right clicking on the Online-Boutique site, you see an option to **"View Source"**

![IE-1](../../images/IE-1.png)

If you select that option on the Online-Boutique you will see the HTML source code as shown below:

![IE-2](../../images/IE-2.png)

## 2 -  Review the unchanged HEAD section

The changes for RUM will be placed in the HEAD section of your Web page, Below are the original lines as you should have it in your local Base version.

![Online Boutique](../../images/ViewBase-HEAD-html.png)

There is no reference to the Splunk or Open Telemetry Beacon (The function that is used to send RUM Metrics and Traces )

## 3. Find the web (URL) of the RUM enabled Online Boutique

The Online Boutique we are going to use for RUM is viewable on port 81 of the RUM Enabled instance's IP address and the url will be provided to you by the workshop instructor at this point.

We are all connecting to the extra RUM Enabled Online Boutique provided by the workshops instructor for this RUM session. Open a new web browser and go to `http://{==RUM-HOST-EC2-IP==}:81/` where you will then be able to see the RUM enabled Online Boutique running. Again, view the source of the HTML Page as described in the previous section:

## 4.  Review the Changes made to enable RUM in the HEAD section of the RUM enabled Online-Boutique

The changes needed for RUM are placed in the HEAD section of the hosts Web page, Below is the hosts updated HEAD section with the changes required to enable RUM:

![Online Boutique](../../images/ViewRUM-HEAD-html.png)

The first three lines  (marked in red) have been added to the HEAD section of the host Web page to enable RUM Tracing, the last three (marked in blue) are optional and used to enable Custom RUM events.

```html
<script src="https://cdn.signalfx.com/o11y-gdi-rum/latest/splunk-otel-web.js" type="text/javascript"></script>
<script>window.SplunkRum && window.SplunkRum.init({beaconUrl: "https://rum-ingest.eu0.signalfx.com/v1/rum",
        rumAuth: "1wCqZVUWIP5XSdNjPoQRFg", app: "ksnq-rum-app", environment: "ksnq-rum-env"});</script>
    <script>
    const Provider = SplunkRum.provider; 
    var tracer=Provider.getTracer('appModuleLoader');
</script>
```

* The first part is to indicate where to download the Splunk Open Telemetry Javascript file from: *<https://cdn.signalfx.com/o11y-gdi-rum/latest/splunk-otel-web.js>* (This can also be loaded locally if so required)
* The second line defines the location where to send the traces to in the beacon url: `{beaconUrl: "https://rum-ingest.eu0.signalfx.com/v1/rum"`
* It also adds an Access Token to :  `rumAuth: "1wCqZVUWIP5XSdNjPoQRFg"` (this of course is an example, you can create multiple RUM Access Tokens for all your applications)
* And it is used to add identification tags like the application Name and environment to the RUM trace for use in the SPLUNK RUM UI:  `app: "ksnq-rum-app", environment: "ksnq-rum-env"}`

{{% alert title="Info" color="info" %}}
In this example the app name is **ksnq-rum-app**, this will be different in the Workshop. Check with your host what the app name and environment to use in the RUM session will be and make a note of it!
{{% /alert %}}

The above two lines are all that is required to enable RUM on your website!

The (blue) optional section that uses `var tracer=Provider.getTracer('appModuleLoader');` will add a custom event for every page change allow you to better track your website conversions and usage.  
