
def lambda_handler(event, context):
    response = {
        "statusCode" : 200,
        "body" : "Hello from SAM"
    }
    return response