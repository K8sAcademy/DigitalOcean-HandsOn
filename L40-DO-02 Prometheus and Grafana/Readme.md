# L40-DO-02

Let's deploy Prometheus and Grafana in our cluster.

## Prometheus Stack

Let's deploy Prometheus and Grafana using the Kubernetes Monitoring Stack 1-Click app:

## Validate that all pods the monitoring pods are running

    kubectl -n kube-prometheus-stack get pods     

## Create the deployment

    kubectl apply -f deploy.yaml

## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=25 --min=1 --max=20

## Port-forward

    kubectl port-forward service/hpa-svc 8080:8080   

## Launch a browser

Launch the Kuard Web app using the IP address you got earlier.

Click on Keygen Workload, check the Enabled checkbox and click on Submit.

## View the Grafana dashboard

    kubectl port-forward svc/kube-prometheus-stack-grafana 8081:80 -n kube-prometheus-stack

Username: admin
Password: prom-operator

## Open a Grafana dashboard

Click on the **dashboard icon** and select **Manage**.

Select **Nodes**.

You should see some metrics for the nodes.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy.yaml

