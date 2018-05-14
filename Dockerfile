FROM openjdk:8-jdk-alpine
MAINTAINER gs11
ENV KARAF_VERSION=4.1.5

RUN apk add --no-cache shadow

RUN groupadd -r karaf -g 1000; \
    useradd -u 1000 -r -g karaf -m -c "Apache Karaf user" karaf

RUN wget http://www-eu.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
	mkdir -p /opt/karaf; \
	tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
	rm apache-karaf-${KARAF_VERSION}.tar.gz; \
	mkdir /deploy

COPY org.apache.karaf.features.cfg /opt/karaf/etc/
COPY karaf-entrypoint.sh /opt/karaf/bin/
COPY maven-settings.xml /opt/karaf/etc/

RUN sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

RUN chown -R karaf:karaf /opt/karaf

USER karaf

VOLUME ["/deploy"]
#EXPOSE 1099 8101 8181 44444
EXPOSE 8181
ENTRYPOINT ["/opt/karaf/bin/karaf-entrypoint.sh"]

WORKDIR /opt/karaf
