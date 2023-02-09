# L36-DO-04

Let's scale our cluster manually.

## Control Panel

Locate your cluster in Control Panel.

Click on the **Resources tab**.

Click on **Resize or Autoscale**, change the number of nodes from 3 to 2.  Click on the **Save** button.

## Terminal

Open a terminal and list the nodes.

    kubectl get no

Let's scale back to 3 nodes. Get your cluster ID

    doctl kubernetes cluster list 

Get the node pool ID

    doctl kubernetes cluster node-pool list [clusterID]

Update the node count

    doctl kubernetes cluster node-pool update [clusterID] [poolID] --count 3

Validate

    kubectl get no