# L102-AZ-02

## Create a new DOKS

We'll use the digitalocean_kubernetes_cluster resource from the DigitalOcean prodider. The documentation is available here:
https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster

## Initialize

    terraform init

## Edit main.tf

You can change some settings like the data center, the kubernetes version and the node count. Refer to this site for a list of slugs:

    https://slugs.do-api.dev/

## Let's test the plan

    terraform validate
    terraform plan

## Let's create the cluster

    terraform apply

Head to the Web console and validate the cluster creation.

## Cleanup

    terraform destroy
