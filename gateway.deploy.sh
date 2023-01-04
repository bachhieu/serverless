# variables set api-gateway config

GATEWAY='gateway'
API='serverless-test-hieu'
SERVICE_ACCOUNT='test-959@serverless-test-hieu.iam.gserviceaccount.com'
CONFIG_SPEC='openapi2-functions.yaml'
CURRENT_TIMESTAMP=$(date +%s)
LOCATION='us-central1'
NEW_CONFIG='gateway-config-'$(date +%s)

CURRENT_CONFIG=$(gcloud api-gateway api-configs list --format="value(CONFIG_ID)" --limit=1)

# reference: https://cloud.google.com/sdk/gcloud/reference/api-gateway

echo 'Creating new api config...'
gcloud api-gateway api-configs create $NEW_CONFIG --api=$API --openapi-spec=$CONFIG_SPEC --backend-auth-service-account=$SERVICE_ACCOUNT
echo 'Updating gateway with new api config...'
gcloud api-gateway gateways update $GATEWAY --location=$LOCATION --api=$API --api-config=$NEW_CONFIG
echo 'Deleting old api config...'
gcloud api-gateway api-configs delete $CURRENT_CONFIG --api=$API
