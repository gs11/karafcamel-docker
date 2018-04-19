#!/bin/sh

# Update karaf password
if [ -n "$KARAFPASSWORD" ]; then
    sed -i -e "s/= karaf/= $KARAFPASSWORD/" /opt/karaf/etc/users.properties;
fi

# Launch Karaf
/opt/karaf/bin/karaf
