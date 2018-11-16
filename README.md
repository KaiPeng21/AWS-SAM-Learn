

## STEP 1 - Create and Deploy a Simple Lambda Function

###### 1.1 create a simple lambda function

Create an **index.py** file in the src folder. This file contains a simple lambda funciton that returns 'Hello from SAM' and an HTTP 200 status code.

###### 1.2 create a cloudformation template

Create a **template.yaml** CloudFormation template file. This file basically just states the lambda resource information (function name,source directory, timeout period, memory usage, IAM role, etc.)

###### 1.3 create a deployment shell script

Create a **deploy.sh** shell script that build the CloudFormation Stack. This script builds the next stage yaml from template.yaml using AWS SAM, stores the build file in S3, and create a CloudFormation Stack.

###### 1.4 execute the deployment script

Make the shell script executable.
```
chmod +x deploy.sh
```

Deploy the script
```
./deploy.sh
```

Check the AWS console. A lambda function should be deployed.


