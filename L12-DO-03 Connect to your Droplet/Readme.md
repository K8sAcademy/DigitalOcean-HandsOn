# L12-DO-03

Let's open an SSH session.

## Previous lab

If you deleted the Droplet from the previous lab.  Go back and create it back again.

## SSH

Open a terminal or use the Web Console.

Using a terminal, type this using the Droplet's IP address:

    ssh root@[ip address]

## Run a container

Run the hello image using a restart policy.

    docker run -d --name hello -p 80:80 --restart unless-stopped guybarrette/hello:latest

## Cleanup

You can now delete the Droplet.
