#!/bin/bash
today=$(date +%y%m%d)
ls -la /usr/bin >../tmp/"$today".log
