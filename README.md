# karafcamel-docker
Docker container with Apache Karaf &amp; Apache Camel

Description
-----------
Containerized from the Apache distribution
- Running as separate user "karaf"
- karaf user password is set upon container creation
- Autoinstallation of various Camel components
- Autoinstallation of ActiveMQ Broker
- Autoinstallation of Hawtio

Build
-----

Edit karafpassword and change the password (if needed) prior to building

```sudo docker build -t karafcamel .```

Run
---

```bash
docker run -d -t \
  --name karafcamel \
  -p 8181:8181 \
  -v /host/path/deploy:/deploy \
  -e KARAFPASSWORD=mypassword
  karafcamel
```

Default password is "karaf" if KARAFPASSWORD environment variable is omitted
