#!/bin/bash

vpc_cidr="10.5.0.0/16"
subnet_cider="10.5.1.0/24"
region="us-east-1"

vpc_id=$(aws ec2 create-vpc --region $region --cidr-block $vpc_cidr --query Vpc.VpcId --output text)

aws ec2 create-subnet --region $region --vpc-id $vpc_id --cidr-block $subnet_cider --query Subnet.SubnetId --output text

igw_id=$(aws ec2 create-internet-gateway  --region $region --query InternetGateway.InternetGatewayId --output text)

aws ec2 attach-internet-gateway --region $region --vpc-id $vpc_id --internet-gateway-id $igw_id

