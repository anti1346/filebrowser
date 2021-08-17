#!/bin/bash

#find /ftp-root/*/ -mindepth 1 -maxdepth 1 -mtime +1 -type d -print
find /ftp-root/*/ -mindepth 1 -maxdepth 1 -mtime +3 -type d -exec rm -rf {} \;
