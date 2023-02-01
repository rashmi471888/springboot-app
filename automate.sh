#!/bin/bash 

tag1=`sed -n '8p' pom.xml | awk -F ">" '{print $2}'|awk -F "<" '{print $1}'`
docker build -t mydocker_repo .
docker tag mydocker_repo:latest 219799410135.dkr.ecr.us-east-1.amazonaws.com/mydocker_repo:$tag1
docker push 219799410135.dkr.ecr.us-east-1.amazonaws.com/mydocker_repo:$tag1
sed -i "s/26/$tag1/g" eks-deploy-k8s.yaml

