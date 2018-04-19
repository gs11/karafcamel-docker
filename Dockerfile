FROM java:8-jdk
MAINTAINER gs11
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV KARAF_VERSION=4.2.0

RUN groupadd -r karaf -g 1000; \
    useradd -u 1000 -r -g karaf -m -c "Apache Karaf user" karaf

RUN wget http://www-eu.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
	mkdir /opt/karaf; \
	tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
	rm apache-karaf-${KARAF_VERSION}.tar.gz; \
	mkdir /deploy

COPY org.apache.karaf.features.cfg /opt/karaf/etc/
COPY karaf-entrypoint.sh /opt/karaf/bin/

RUN sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

RUN chown -R karaf:karaf /opt/karaf

USER karaf

VOLUME ["/deploy"]
#EXPOSE 1099 8101 8181 44444
EXPOSE 8181
ENTRYPOINT ["/opt/karaf/bin/karaf-entrypoint.sh"]

WORKDIR /opt/karaf
