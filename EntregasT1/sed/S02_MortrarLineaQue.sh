#!/bin/bash
# Muestra líneas con 'nologin'
 
sed -n '/nologin/p' /etc/passwd.bak
