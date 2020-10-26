#!/bin/bash

aws ec2 describe-instances --query 'Reservations[?Instances[?Tags[?Key==`microbiome2020-prod`]]].Instances[].InstanceId' --profile microbiome | grep i- \
 | awk '{print $1}' \
 | sed 's/\"//g' | sed 's/,//' | xargs -L1 -I% aws ec2 modify-instance-attribute --instance-id  % --no-disable-api-termination --profile microbiome  
