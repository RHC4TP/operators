## MariaDB Simplified Helm Chart

This is a much-simplified example chart for MariaDB, which is purely intended for demonstration and educational purposes.
It only supports running as a single instance and cannot be used to install clustered instances of MariaDB, as separate deployments for master and slave instances are not defined.
There is currently no support for data persistence, so any/all data is ephemeral and will be lost when the Pod dies.
