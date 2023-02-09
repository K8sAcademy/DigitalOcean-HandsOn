# L14-DO-02

Let's create and use a Block Storage volume.

## Create a new Droplet

Create a new Droplet using Docker from the Marketplace.

Scroll down until you see the **Add Block Storage** section and click on the **Add Volume** button.

Leave the default settings as is.  This way, the volume will be automatically formatted and mounted to the Droplet.

## Get the volume name

After the Droplet is created, select it and click on the **Volumes** left menu. You should see the volume listed.

Open a Web Console or use the ssh tool and type the following command to list the volumes. You should see the one that was mounted for you.

    ls /mnt

## Run a Nginx container that will use the volume

In the following command, replace the volumen placeholder by the name of your volume.

    docker run -d --name voltest1 -v [volumeName]:/lab nginx:latest

Run the command.

## Connect to the instance

    docker exec -it voltest1 bash

## Let’s create a file in the volume

    cd lab
    echo Hello from Voltest1 > Hello1.txt

Detach from the instance:

    exit

## Run a second Nginx container that will use the volume

    docker run -d --name voltest2 -v [volumeName]:/lab nginx:latest

## Connect to the instance

    docker exec -it voltest2 bash

## Is the file visible?

    ls lab
    exit

## Cleanup

You can delete the Droplet.  To delete the Block-Storage volume automatically, check **Show Associated Resources** and select the volume.
