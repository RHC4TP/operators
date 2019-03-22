## MariaDB Helm Operator

This is a simplified example Helm Operator for MariaDB, which is purely intended for demonstration and educational purposes.
It only supports creating a single DB instance and does not support a clustered DB, because separate deployments for master and slave DB instances are not (yet) defined.
There is currently no support for data persistence, so any/all data is ephemeral and will be lost when the Pod dies.
