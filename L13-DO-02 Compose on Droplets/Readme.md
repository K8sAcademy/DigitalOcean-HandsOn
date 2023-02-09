# L13-DO-02

Let’s deploy a multi containers app.

---

## Optionally, build the Reverse Proxy and push it to a registry

    docker build -t [yourRegistry]/reverseproxy:latest .
    docker push [yourRegistry]/reverseproxy:latest

Edit the Docker-Compose file to change the location of the Reverse Proxy image.

---

## Test the app locally

Use docker-compose to build and run the app locally.

    docker-compose up -d

Open a browser and type http://localhost/hello

In a new browser tab, type http://localhost/bonjour

Notice that the server name is different.

---

## Control Panel

Head to the Control Panel and create a new Droplet using Docker from the Marketplace.

## Web Console

Download the Compose file using curl or wget

    curl https://raw.githubusercontent.com/K8sAcademy/DigitalOcean-HandsOn/main/L13-DO-02%20Compose%20-%20on%20Droplets/docker-compose.yml -o docker-compose.yml

## Terminal

If you want to upload the file from a terminal, you can use:

    scp docker-compose.yml user@[droplet-ip]:docker-compose.yml

or

    sftp user@[droplet-ip]
    >put docker-compose.yml
    >exit

## Start the app

    docker-compose up -d

## Test in a browser

In a new browser tab, test both routes and notice that the server names are different.

## Cleanup

In the Control Panel, delete the Droplet you just created.

