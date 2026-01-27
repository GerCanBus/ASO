#!/bin/bash
# Elimina comentarios y líneas en blanco

sed -e '/^[[:space:]]*#/d' -e '/^$/d' /etc/services.bak
