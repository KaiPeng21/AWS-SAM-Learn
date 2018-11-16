#!/bin/bash

PROJECT=sam-tutorial

BUCKET=$PROJECT-101602

# make a build directory to store artifacts
rm -rf build
mkdir build

# make the deployment bucket in s3 if it does not exist
aws s3 mb s3://$BUCKET

# generate next stage yaml file
aws cloudformation package \
    --template-file template.yaml \
    --output-template-file build/output.yaml \
    --s3-bucket $BUCKET

# the actual deployment step
aws cloudformation deploy \
    --template-file build/output.yaml \
    --stack-name $PROJECT \
    --capabilities CAPABILITY_IAM


