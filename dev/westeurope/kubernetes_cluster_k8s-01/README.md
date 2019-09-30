# Kubernetes HowTo

## Cleanup: delete previous contexts

```shell
kubectl config unset contexts.pdnd-dev-aks-k8s-01
kubectl config unset clusters.pdnd-dev-aks-k8s-01
kubectl config unset users.clusterUser_pdnd-dev-rg_pdnd-dev-aks-k8s-01
```

## Download a new cluster configuration and switch context

```shell
# List clusters
az aks list

# Get kube config file (merges it with .kube/config)
az aks get-credentials -n pdnd-dev-aks-k8s-01 -g pdnd-dev-rg

# Switch context
kubectl config use-context pdnd-dev-aks-k8s-01

# Query K8S for existing pods
kubectl get pods
```

## See Kubernetes dashboard

```shell
az aks browse --resource-group pdnd-dev-rg --name pdnd-dev-aks-k8s-01
```

## Create demo container and expose it publicly

This is a quick demo to test the system. A deployment should be created and a public IP should be given to the service connected to the POD.

```shell
# Create a K8S deployment (of one pod) starting from the image gcr.io/hello-minikube-zero-install/hello-node
kubectl create deployment hello-node --image=gcr.io/hello-minikube-zero-install/hello-node

# Create an Azure load balancer that connects to the deployment, exposing port 8080
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
```

## Create a POD (yaml version)

Push this yaml file with `kubectl apply -f filename.yaml`

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: try
  labels:
    app: internal-app
spec:
  containers:
    - name: try
      image: "gcr.io/hello-minikube-zero-install/hello-node"
```

## Create services (yaml version)

This is a quick overview extracted from here: `https://docs.microsoft.com/en-us/azure/aks/internal-lb`

In the following example, port `8080` is exposed. The target port gets the same value.

Push the file yaml below using the `kubectl apply -f filename.yaml` command.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
  annotations:
    # Set the line below to false or remove it if you'd like to get a public
    # IP address allocated instead
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
spec:
  type: LoadBalancer
  ports:
  - port: 8080
  selector:
    app: internal-app
```

# Kubernetes cluster configuration

All Kubernetes cluster configurations are available at [this repository](https://github.com/teamdigitale/pdnd-infra-post-config).
