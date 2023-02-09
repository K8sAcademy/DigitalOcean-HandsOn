# L31-DO-03

## Linode CLI

Open a terminal.

We need to get the region code from the regions list.

    doctl kubernetes options regions

Copy the region code for the data center near you.

We need to get the VM size code from the Droplet types list.

    doctl kubernetes options sizes

Copy the code for the size you want to use.  Recommended size: s-1vcpu-2gb

## Create the cluster

Replace the values in the following command with the values you want to use

    doctl kubernetes cluster create <name> --region <region> --size s-1vcpu-2gb --count 1

Let's get a list of the clusters

    doctl kubernetes cluster list

## Cleanup

Delete the cluster you created using the CLI.

Get the cluster ID

    doctl kubernetes cluster list

Delete the cluster

    doctl kubernetes cluster delete [clusterID]

Confirm by listing again

    doctl kubernetes cluster list