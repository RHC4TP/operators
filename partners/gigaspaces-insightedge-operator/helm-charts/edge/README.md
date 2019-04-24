# GigaSpaces XAP Helm Chart

## Prerequisites

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [helm](https://docs.helm.sh/using_helm/#quickstart-guide)
* Kubernetes 1.9+ cluster (cloud, on-premise, or local via [minikube](https://kubernetes.io/docs/setup/minikube/))

## Chart Components

This chart will do the following:

* Create a Platform Manager in a Management Pod. The Platform Manager consists of a Lookup Service, REST Manager API and Apache ZooKeeper.
* Create a Data Grid in a Data Pod. The Data Grid is a partitioned Space.
* Create a headless service to control the discovery of Data Pods.

This chart can optionally do the following:

* Optionally apply Pod anti-affinity to spread the partitions across nodes.
* Optionally apply high availability so each primary Data Pod has one backup Data Pod.
* Optionally apply high availability by deploying three Management Pods, so that a quorum of Platform Managers is always available to manage the Spaces.


## Installing the Chart

```console
$ helm install xap --name hello
```

This will create a Space cluster called `hello`, with a single partition and no backup Pods.
This will also create a Manager called `hello-xap-manager` to manage the Space.

## Configuration

You can specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install xap --name hello -f values.yaml
```

## Installing the Components Separately

If you want to connect multiple Spaces to a single Platform Manager, you should deploy the Management Pod first,
and after the Management Pod has been deployed and the Platform Manager is available, you can deploy the Space
instances and connect them to the Platform Manager.

Use the following Helm command to deploy a Management Pod `testmanager` and then deploy a cluster of Data Pods
called `testspace` with n partitions, and specify that the cluster should connect to the `testmanager` Management Pod:

```console
$ helm install xap-manager --name testmanager --set space.enabled=false
$ helm install xap-pu --name testspace --set manager.name=testmanager,partitions=1

```

## Installing a Processing Unit

To install a Processing Unit, the URL of the JAR file should be set using the `space.pu.resource`, and
specify the `space.manager` to allow discovery using the `testmanager` Management Pod.

```console
$ helm install xap-pu --name myProcessingUnit --set manager.name=testmanager,resourceUrl=http://<IP>:<port>/my-pu.jar
```

## More Information

More information is available in GigaSpaces' documentation website:
https://docs.gigaspaces.com/xap/14.0/admin/kubernetes-overview.html