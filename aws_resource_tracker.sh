#!/bin/bash

################# Metadata ##################################
# Author - Yash
# Date - june 13
# Description - this script will report the AWS resource usage, and  save the  report in a txt file 
# Version - v1
##############################################################


#Aws S3
#Aws EC2
#ASW Lambda
#AWS IAM Users

set -x

echo "Print list of s3 buckets"
# list s3 buckets 
aws s3 ls > resourceTracker

echo "Print list of EC2 instances present"
#list EC2 instances
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker


echo "list of lambda functions "
#list lambda 

aws lambda list-functions >> resourceTracker

echo "Print list of IAM users"
#list IAM users
aws iam list-users >> resourceTracker
