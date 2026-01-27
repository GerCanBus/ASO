#!/bin/bash
# Muestra líneas que empiezan por 'ftp'

sed -n '/^ftp/p' /etc/services.bak
