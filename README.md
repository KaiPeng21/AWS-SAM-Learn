

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

## STEP 2 - Route the Lambda Function to API Gateway

###### 2.1 update the CloudFormation template

Update **template.yaml** and enable the lambda resource to use an Api event. You don't have to add an API Gateway resource. SAM is smart enough to know that an API Gateway is needed if you specify that the lambda function has an API endpoint.

###### 2.2 re-deploy the CloudFormation stack

```
./deploy.sh
```

Check and test API Gateway from AWS console. To view the API from the given endpoint, you have to enable CORS.

## STEP 3 - Create a DynamoDB table 

###### 3.1 update the CloudFormation template

Update **template.yaml** and create a new SimpleTable type resource. Specify the primary key and read/ write capacity unit.

###### 3.2 re-deploy the CloudFormation stack

```
./deploy.sh
```

Check the DynamoDB table from AWS console. 

## STEP 4 - Route the DynamoDB table to lambda function

###### 4.1 update the CloudFormation template

Update **template.yaml**. Assign AmazonDynamoDBFullAccessRole to the lambda function. Assign the environment variables using the Ref intrinsic function.

###### 4.2 update lambda function

Update **src/index.py**. Scan the dynamoDB table using Boto3 and have the output return a boto3 resource.