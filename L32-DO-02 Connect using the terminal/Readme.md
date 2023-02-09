# L32-DO-02

Let's connect to our cluster.

## Control Panel

In the Control Panel, select the cluster you created earlier or create a new one.

In the Getting Started section, click on **Step 2 Connecting to Kubernetes** and copy the command from the **Automated tab**.

Run the command in a terminal.

## Change context

List the contexts

    kubectl config get-contexts

Change context

    kubectl config use-context [contextName] 

List the nodes

    kubectl get nodes -o wide

## Voting app

The source code is available here: https://github.com/dockersamples/example-voting-app

## Deploy the app

    kubectl create namespace vote
    kubectl create -f vote/

## Get the pods info

    kubectl get pods -n vote

## Get the services info

    kubectl get svc -n vote   

## Monitor the load balancers configuration progress

    kubectl get svc -n vote --watch

In Control Panel, click **Networking** in the left menu, then click on the **Load Balancers tab** and locate the two load balancers.

Get the external IP for the **vote** service and test in a browser using port 5000.

Get the external IP for the **result** service and test in a browser to see the results using port 5001.

---

## OPTIONALY Set the KUBECONFIG env variable

In the Getting Started section, click on **Step 2 Connecting to Kubernetes** and copy the command from the **Manual tab**.

Download the configuration file.

Open a terminal.

Change the context to Docker-Desktop

    kubectl config use-context docker-desktop

Set the KUBECONFIG env variable by using the syntax for your OS

Linux/Mac

    export KUBECONFIG=C:\DO\lab-kubeconfig.yaml

Powershell

    $env:KUBECONFIG="C:\DO\lab-kubeconfig.yaml"

DOS

    set KUBECONFIG="C:\DO\lab-kubeconfig.yaml"

Run a command

    kubectl get nodes

## Close the terminal

Close the terminal and open a new one.  Our context is gone!

---

## Cleanup

Deleting the namespace will delete all the child ressources.

    kubectl delete ns vote

Optionally, delete the cluster.
