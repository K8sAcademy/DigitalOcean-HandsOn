# L101-DO-03 Providers

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Create a new Terraform file

Create a new folder.

Create a new file and name it **main.tf**

## Find the DigitalOcean provider settings

Head to https://registry.terraform.io

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L101-DO-03-01.png)

Locate the DigitalOcean provider and click on the **Use Provider** button.

Copy the code and paste it in the main.tf file.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L101-DO-03-02.png)

## Edit the code

Replace this line

    # Configuration options

With this

    token = "[your token]"

Save the file

## Create an API token

In the DigitalOcean console, click on **API** in the left menu and then click on the **Generate New Token** button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L101-DO-03-03.png)

Make sure that you check the **Write scope**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L101-DO-03-04.png)

Copy the token

![image](https://kubernetesacademy.online/wp-content/uploads/2022/03/L101-DO-03-05.png)

In the **main.tf** file, replace the [your token] placeholder with your DigitalOcean token.

Save the file.

## Init the folder

    terraform init

You should see some new files and folders being created in the working folder.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-05 Validate/Format

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Let's try the fmt command

Change the position of these two lines a little bit so that they are no longer aligned. Note that the version number can differ, that's OK. Save the file.

    source = "digitalocean/digitalocean"
    version = "2.18.0"

Run the fmt command

    terraform fmt

The lines should be aligned correctly now.

## Let's validate

Run the validate command

    terraform validate

All is good.  Let's change this line

    source  = "digitalocean/digitalocean"

to this by changing the source parameter to **sources**. Save the file.

    sources  = "digitalocean/digitalocean"

Run validate again

    terraform validate

There's an error now.  Remove the extra character and save the file.

## Create a project

Add the following code to create a project.

    resource "digitalocean_project" "k8slab" {
      name        = "k8slab"
      description = "A project for my K8s Academy labs."
    }

Run the validate command

    terraform validate

All is good.  Remove this mandatory parameter. Save the file.

    name     = "k8slab"

Run the validate command

    terraform validate

There's an error!  Replace the name parameter, save the file and validate again.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-07 Plan

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Let's create a plan

Run the plan command

    terraform plan

Save a plan by typing

    terraform plan -out=myplan

The plan has been saved to the **myplan** file.

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-09 Apply

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Let's create the project

    terraform apply

Head to the portal and validate that the project was created or check using the CLI

    doctl projects list --format "Name,Description,Purpose,Environment"

Let's make a change by setting the purpose property. Add this to the project definition in main.tf

    purpose     = "Other"

Format and validate

    terraform fmt
    terraform validate

Check what will Terraform do

    terraform plan

The resource will be updated, not replaced. Good! Let's deploy the change.

    terraform apply

Check that the change was correctly applied

    doctl projects list --format "Name,Description,Purpose,Environment"

List the objects in the Terraform state

    terraform state list

There's only one and it's the project.  Copy it's name and show it.

    terraform state show [name]

Inspect the state file by clicking on the terraform.state file.

Let's now delete the project by typing

    terraform destroy

Let's check

    doctl projects list --format "Name,Description,Purpose,Environment"

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-11 Variables

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Let's now use variables

Edit the main.tf file by creating a local variable for the project name.

    locals {
      project_name = "k8slab"
    }

Now get the name from the variable

    name     = local.project_name

## Create 2 new files: **variables.tf** and **terraform.tfvars**

Edit the **variables.tf** file to declare 2 variables. Note that project_name does not have a default value.

    variable "project_description" {
      type = string
      description = "Something about the project"
    }
    
    variable "project_purpose" {
      type = string
      default = "Other"
      description = "What's it for?"
    }

## Edit the **terraform.tfvars** file 

Add these values

    project_description = "My awesome project"
    project_purpose = "Web Application"

## Edit the **main.tf** file 

Use the newly created variables

    resource "digitalocean_project" "k8slab" {
      name        = local.project_name
      description = var.project_description
      purpose     = var.project_purpose
    }

## Let's validate, plan and deploy

The plan outpout should display the values we used as variables

    terraform validate
    terraform plan

Deploy

    terraform apply

Let's check

    doctl projects list --format "Name,Description,Purpose,Environment"

Let's now delete the project by typing

    terraform destroy

Let's check

    doctl projects list --format "Name,Description,Purpose,Environment"

Let's try to override the description on the command line. The plan should display that value.

    terraform plan -var="project_description=HelloWorld"

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-13 Workspaces

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

Do we have a workspace already?

    terraform workspace list

Of course, it's the default one.

Let's deploy a project

    terraform apply
    terraform state list
    terraform state show []

## New workspace

Let's create a new workspace

    terraform workspace new dev
    terraform workspace list

Change the project name to something different, and deploy

    project_name = "k8slab2"
    terraform apply

Check the state file

    terraform state list
    terraform state show []

Let's destroy this project

    terraform destroy

## Switch back to the default workspace

    terraform workspace select default

But we still share the main.tf file between all workspaces!

Change the name back and delete the dev workspace.

    project_name = "k8slab"
    terraform workspace delete dev
    terraform workspace list
    terraform destroy

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-15 Modules

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## The Naming module

Let's use a module from the Terraform registry. It's a module that helps with the naming or resources and we'll use it to generate a unique name for our project.  You can look at the documentation here: https://registry.terraform.io/modules/Azure/naming/azurerm/latest

In the **main.tf** file, add the module using the following code. We'll prefix the generated names with the **lab** string.

    module "naming" {
      source = "Azure/naming/azurerm"
      prefix = ["lab"]
    }

Next, replace the project name parameter line with this one:

    name     = module.naming.app_service.name_unique

Save the file and let's create a plan.  We have an error!  We first need to run init to download the module.

    terraform init
    terraform plan
    terraform apply

Let's see what was generated

    doctl projects list --format "Name,Description,Purpose,Environment"

Let's now delete the project by typing

    terraform destroy

Let's check

    doctl projects list --format "Name,Description,Purpose,Environment"

## Cleanup

Don't delete the files yet. Keep them for the next lab.

---

# L101-DO-16 Output variables

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

## Create a new file

Create a new file named **output.tf**

## Edit the **output.tf** file

Add the following output variables

    output "project_name" {
      value = digitalocean_project.k8slab.name
    }

    output "rg_description" {
      value = digitalocean_project.k8slab.description
    }

    output "rg_purpose" {
      value = digitalocean_project.k8slab.purpose
    }

## Validate and deploy

    terraform validate
    terraform apply

You should see the output values

## Destroy

Let's now delete the project by typing

    terraform destroy

Let's check

    doctl projects list --format "Name,Description,Purpose,Environment"

## Cleanup

Delete the **output.tf** file. Keep the rest for the next lab.

---

# L101-DO-17 HCL Language

**Note: All the L101-DO-[*] labs are part of a sequence and build upon each other.**

Let's create 3 droplets by using a for_each loop.

## Cleanup main.tf

Edit the **main.tf** file and remove everything except the terraform and provider blocks.

    resource "digitalocean_droplet" "mydroplet" {
      for_each = toset( ["demo1", "demo2", "demo3"] )
      name   = each.key
      image  = "ubuntu-21-10-x64"      
      region = "nyc1"
      size   = "s-1vcpu-1gb"
    }

You can edit the values like changing the data center if you want. This Website list the possible values:

    https://slugs.do-api.dev/

Generate a plan and deploy

    terraform plan
    terraform apply

Let's see what was generated

     doctl compute droplet list --format "Name,Region"

Let's now delete the project by typing

    terraform destroy

Let's check

     doctl compute droplet list --format "Name,Region"

## Cleanup

You can delete the files.