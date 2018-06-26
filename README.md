# karafcamel-docker
Docker container with Apache Karaf &amp; Apache Camel

Description
-----------
Containerized from the Apache distribution
- Running as separate user "karaf"
- karaf user password is set upon container creation
- karaf maven proxy is set upon container creation
- Autoinstallation of various Camel components
- Autoinstallation of ActiveMQ Broker
- Autoinstallation of Hawtio
- ActiveMQ configured with producerFlowControl set to false for queues

Build
-----

```sudo docker build -t karafcamel .```

Run
---

```bash
docker run -d -t \
  --net="host"
  --name karafcamel \
  -p 8181:8181 \
  -v /host/path/deploy:/deploy \
  -e KARAFPASSWORD=mypassword \
  -e MAVENPROXYHOST=myproxyhost \
  -e MAVENPROXYPORT=myproxyport
  karafcamel
```

Default password is "karaf" if KARAFPASSWORD environment variable is omitted.
Default is that no proxy is configured if those environment variables are omitted.
