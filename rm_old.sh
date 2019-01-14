#!/bin/bash

dir="/var/www/files"

find $dir -type f -mtime +90 -exec rm -rf {} \; 
