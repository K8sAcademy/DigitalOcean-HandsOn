# L102-AZ-02

## Create a new DOKS

Open a terminal and navigate to the **create** folder

    cd create

## Edit main.tf

You can change some settings like the data center, the kubernetes version and the node count. Refer to this site for a list of slugs:

    https://slugs.do-api.dev/

## Initialize the create folder

    terraform init

## Let's create the cluster

    terraform apply

Wait for the cluster to be created.

## Use a Data Source

In the terminal, navigate to the **query** folder.

    cd ../query

## Initialize the query folder

    terraform init

## Query the data source

    terraform apply

## Cleanup

Navigate to the **create** folder.

    cd ../create
    terraform destroy
