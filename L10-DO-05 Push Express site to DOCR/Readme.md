# L10-DO-05

Push an image to DigitalOcean Container Registry

## Control Panel

Open the Control Panel and create your registry.  The **Starter** sku will be enough.

## Build the image

    docker build -t registry.digitalocean.com/<my-registry>/expressapp:v1 .

## Push the image

    docker push registry.digitalocean.com/<my-registry>/expressapp:v1

This will fail if you haven't logged in first.  Log in and try again.

    doctl registry login

## List the images in your DOCR

    doctl registry repo list-v2

## Control Panel

Back in the Control Panel, locate the image you just pushed.

## Pull the image from DOCR

Remove the local image first

    docker rmi registry.digitalocean.com/<my-registry>/expressapp:v1

Then pull it

    docker pull registry.digitalocean.com/<my-registry>/expressapp:v1

## Run

    docker run -d -p 3000:3000 --name myapp-1 registry.digitalocean.com/<my-registry>/expressapp:v1

## Test in a browser

Test that the app is running by heading to http://localhost:3000

---

## Create version 2

Let’s first make a change to the code, build a new image and tag it as version 2 and push it to DOCR.

## Code change

In code, locate the index.js file in the routes folder. Change the title value from Express to **Express2**. Save the file.

## Build the image

    docker build -t registry.digitalocean.com/<my-registry>/expressapp:v2 .

## Push the image

    docker push registry.digitalocean.com/<my-registry>/expressapp:v2

## List the repos in your DOCR

    doctl registry repo list-v2

## Pull the image

Remove the local image first

    docker rmi registry.digitalocean.com/<my-registry>/expressapp:v2

Then pull it

    docker pull registry.digitalocean.com/<my-registry>/expressapp:v2

## Run

    docker run -d -p 3001:3000 --name myapp-2 registry.digitalocean.com/<my-registry>/expressapp:v2

## Test in a browser

Test that the app is running by heading to http://localhost:3001

## Cleanup

    docker stop myapp-1
    docker rm myapp-1
    docker stop myapp-2
    docker rm myapp-2
    docker rmi registry.digitalocean.com/<my-registry>/expressapp:v1
    docker rmi registry.digitalocean.com/<my-registry>/expressapp:v2

## Delete a repository's tag

    doctl registry repository delete-tag expressapp v1

In the Control Panel, confirm that the v1 tag was removed

## Delete the repositories

In the Control Panel, delete the repository

