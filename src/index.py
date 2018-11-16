import boto3
import os
import json

def lambda_handler(event, context):
    DB_TABLE_NAME = os.getenv('DB_TABLE_NAME')
    
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(DB_TABLE_NAME)
    table_results = table.scan()

    response = {
        "statusCode" : 200,
        "body" : json.dumps(table_results)
    }
    return response