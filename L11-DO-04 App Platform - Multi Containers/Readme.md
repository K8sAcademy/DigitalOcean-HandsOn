# L11-DO-04

Let's deploy more then one container on App Platform.

## Previous Lab

We're building on what we did in the previous lab. If you have deleted the app, simply go back, create it again and come back here.

## Add a second container

Select your app and click on the **Settings** tab.

Click on the App icon.

Scroll down the page and download the App Spec file.

## Edit the App Spec

Open the App Spec file and add the following information at the end of the file:

    - internal_ports: 
        - 80
      image:
        registry: k8sacademy
        registry_type: DOCKER_HUB
        repository: hello
        tag: latest
      instance_count: 1
      instance_size_slug: basic-xs
      name: hello-backend
      source_dir: /

## Upload the file

Upload the spec file.  You should see that App Platform has detected a change and is creating a new component.

## Test the connectivity

Click on the **Console** tab.

Select the main component.

In the console, type the following:

    wget -O- http://hello-backend

## Cleanup

Do not delete the app. We will use it in the next lab.
