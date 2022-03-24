# L101-AZ-19

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Create a Space

To use a backend in DigitalOcean, let's first create a storage space using the Web Console.

Open the **Create** menu and select **Spaces**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-01.png)

Select a region and leave the file listing to **Restrict**

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-02.png)

Choose a unique name, select a project and click on the **Create Space** button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-03.png)

## Edit the main.tf file

Edit the **main.tf** file and locate your Space name and endpoint.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-04.png)

Replace the region placeholder with the data center value. In the previous screenshot, it's **NYC3** but make sure to remove the Space name from the endpoint.

    endpoint = "https://[region].digitaloceanspaces.com" 

Set the bucket name. In the previous screenshot, it's **k8slab**.

    bucket = ""

## Create an access key

Click on the **API** menu, scroll down to the **Spaces Access Keys** section and click on the **Generate New Key** button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-05.png)

A key and a secret will be generated.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-06.png)

Copy the key and use it for the **access_key** value.

    access_key = ""

Copy the secret and use it for the **secret_key** value.

    secret_key = ""    

## Personal access token

Use your DigitalOcean **personal access token** as the provider token value. If you don't remember it, simple create a new one by clicking on the **API** menu.

    token = ""

Save the file.

## Let's init the backend

    terraform init

## Validate & Deploy

We will create a new droplet. You can edit the values like changing the data center if you want. This Website list the possible values:

    https://slugs.do-api.dev/

Validate you code

    terraform validate

Deploy

    terraform apply

Head to the DO console and valaidate that a droplet was created.

## State file

Locate the Space. You should see the state file.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L102-DO-02-07.png)

## Cleanup

Delete the droplet.

    terraform destroy

You can also delete the **Space** by selecting it, clicking on the **Settings** tab and clicking on the **Destroy** button.