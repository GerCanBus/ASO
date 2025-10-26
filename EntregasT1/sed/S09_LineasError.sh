#!/bin/bash
# Muestra las primeras 5 líneas con 'error'

sed -n '/error/{x;/./{g;s/.*/&./;};H;g;/.\{5\}$/q;p;}' /var/log/syslog
