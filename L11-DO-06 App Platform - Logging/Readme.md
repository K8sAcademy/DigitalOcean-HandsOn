# L11-DO-06

Let's access the App Platform logs.

## Previous Lab

We're building on what we did in the previous lab. If you have deleted the app, simply go back, create it again and come back here.

## Locate the logs

Select your app and click on the **Runtime Logs** tab.

Select the main component.

Open the app in a browser and refresh the page a few times. You should see new rows appearing in the log window.

## CLI

Retrieve the app and deployment IDs

    doctl apps list
    doctl apps list-deployments <app id>

Get the logs

    doctl apps logs <app id> <component name> --deployment <deployment id> -f

## Cleanup

You can now delete the app.

