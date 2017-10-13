#!/bin/sh

PORT=8080
IFACE=eth0

fail_with() {
    echo $1
    exit 1
}

configure() {
    ifconfig $IFACE $1
}

{

    if [ "$BOOT_TMP_IP" = "" ]; then 
        fail_with "BOOT_TMP_IP is missing"
    fi;

    if [ "$LOG_DEVICE" = "" ]; then 
        fail_with "LOG_DEVICE is missing"
    fi;

    if [ "$METADATA_SERVER" = "" ]; then 
        fail_with "METADATA_SERVER is missing"
    fi;

    # Tmp address
    configure $BOOT_TMP_IP

    # Wait for metadata to be available
    while ! nc -z $METADATA_SERVER $PORT; do
        echo "Waiting for metadata server to be up"
        sleep 1
    done

    MAC=$(cat /sys/class/net/$IFACE/address)
    VARS=$(wget -qO- http://$METADATA_SERVER:$PORT/metadata?id=$MAC)

    eval $VARS

    if [ "$IP" = "" ]; then 
        fail_with "No IP was attributed, shutdown interface..."
        configure down
    fi;

    configure $IP

    echo "Custom DHCP: $IP has been assigned"

} 2>&1 | tee $LOG_DEVICE
