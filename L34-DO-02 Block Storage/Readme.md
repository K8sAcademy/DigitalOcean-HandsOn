# L34-DO-02

Let's mount a Block Storage volume.

## Validate that the default StorageClass are available

    kubectl get sc

## Deploy the claim

    kubectl apply -f pvc.yaml

## Look at the pvc

    kubectl get pvc

## Control Panel

In Control Panel, click on Volumes in the left menu and validate that a new Block Storage service was created.

## Set a label on one node

To make sure that the next pods will be created on the same node, we will apply a label on one node.

Get the node list

    kubectl get no

Copy one node name and apply the label

    kubectl label nodes [nodeName] hello=world

## Deploy the pod 1

    kubectl apply -f pod1.yaml

## Connect to the Busybox

    kubectl exec mybox1 -it -- /bin/sh

## Create a file

    ls
    cd dodisk
    echo Hello World > hello.txt
    ls
    exit

## Deploy the pod 2

    kubectl apply -f pod2.yaml

## Connect to the Busybox

    kubectl exec mybox2 -it -- /bin/sh

    cd dodisk
    ls
    cat hello.txt
    exit

## Cleanup

    kubectl delete -f pod1.yaml --grace-period=0 --force
    kubectl delete -f pod2.yaml --grace-period=0 --force
    kubectl delete -f pvc.yaml

Since we used the storage class with a retain policy set to Delete, the Block Storage service will be deleted automatically.
