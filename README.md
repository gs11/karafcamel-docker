# karafcamel-docker
Docker container with Apache Karaf &amp; Apache Camel

Description
-----------
Containerized from the Apache distribution
- Running as separate user "karaf"
- karaf user password read from separate file upon build
- Autoinstallation of various Camel component
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
  karafcamel
```
