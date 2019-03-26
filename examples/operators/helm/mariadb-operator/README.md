# MariaDB Helm Operator
This is a simplified example Helm Operator for MariaDB, which is purely intended for demonstration and educational purposes.
It only supports creating a single DB instance and does not support a clustered DB, because separate deployments for master and slave DB instances are not (yet) defined.
There is currently no support for data persistence, so any/all data is ephemeral and will be lost when the Pod dies.

## Prerequisites
The MariaDB Operator will (by default) deploy MariaDB version 10.2 from Red Hat Software Collections for RHEL 7.
The image will pull from the [Red Hat Container Catalog](https://access.redhat.com/containers), which will require the following:

* RHN account (https://access.redhat.com)
* RHCC Image pull secret in your project/namespace or [Red Hat Container Registry Authentication](https://access.redhat.com/RegistryAuthentication) setup on your OpenShift cluster

To create an `rhcc` secret using docker (requires root/sudo or you must be in the docker group):
```
# docker login -u <username> registry.connect.redhat.com
Password:
Login Succeeded
# oc create secret generic rhcc --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
```

To create an `rhcc` secret using podman:
```
$ podman login -u <username> registry.connect.redhat.com
Password:
Login Succeeded!
$ oc create secret generic rhcc --from-file=.dockerconfigjson=$XDG_RUNTIME_DIR/containers/auth.json --type=kubernetes.io/dockerconfigjson
```

To link the `rhcc` secret to the `default` service account to use as an image pull secret in the current project/namespace:
```
$ oc secrets link default rhcc --for=pull
```

## Required Parameters

It is recommended to supply your own username & passwords, although static default passwords (as well as user and db names) are provided as a fallback.

Note that the passwords are kept in a base64-encoded Secret, however all values are visible as plain text within the Custom Resource spec.

Values are relative to the `spec:` field in the Custom Resource.

* **db.username** - The username used to access the database (defaults to exampleusr)
* **db.password** - The password used to access the database
* **db.rootPassword** - The MariaDB root password
* **db.name** - The name of the database to be created (defaults to sampledb)

## Advanced Features

This is mostly a TODO section, however you can define your own values as required for the following fields:

Values are relative to the `spec:` field in the Custom Resource.

* **image.registry** - The dns hostname of the desired container image registry (defaults to `registry.access.redhat.com`)
* **image.repository** - The repository path (appended to the registry URL) above where the container image resides (defaults to `rhscl/mariadb-102-rhel`)
* **image.tag** - The container image tag (defaults to `:latest`)
* **db.config** - The MariaDB configuration populating `my.cnf` inside the container. Keep in mind that the `rhscl/mariadb-102-rhel` container is hard-coded to expose port 3306 (if you want to change this then you'll have to specify a custom MariaDB container image)
* **resources** - Define your own Pod resource limits (`limits.cpu` and `limits.memory`)
* **service.type** - The type of Service to configure for MariaDB (defaults to `ClusterIP`)
* **service.port** - The TCP port that the Service will listen on

