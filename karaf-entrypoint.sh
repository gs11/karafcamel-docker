#!/bin/sh

if [ ! -f /opt/karaf/configured ]; then
    # Update karaf password
    if [ -n "$KARAFPASSWORD" ]; then
        sed -i -e "s/= karaf/= $KARAFPASSWORD/" /opt/karaf/etc/users.properties;
    fi

    # Update maven proxy
    if [ -n "$MAVENPROXYHOST" ] && [ -n "$MAVENPROXYPORT" ]; then
        echo "org.ops4j.pax.url.mvn.proxySupport=true" >> /opt/karaf/etc/org.ops4j.pax.url.mvn.cfg
        echo "org.ops4j.pax.url.mvn.settings=/opt/karaf/etc/maven-settings.xml" >> /opt/karaf/etc/org.ops4j.pax.url.mvn.cfg
        sed -i -e "s/proxyhost/$MAVENPROXYHOST/" /opt/karaf/etc/maven-settings.xml
        sed -i -e "s/proxyport/$MAVENPROXYPORT/" /opt/karaf/etc/maven-settings.xml
    fi

    touch /opt/karaf/configured
fi

# Launch Karaf
/opt/karaf/bin/karaf
