#!/bin/bash

DATAVERSE_URL=${DATAVERSE_URL:-"http://localhost:8080"}
SCRIPT_PATH="$(dirname "$0")"

# read API_TOKEN from the secret file #copilot
if [ -f "$SCRIPT_PATH/secret" ]; then
    API_TOKEN=$(<"$SCRIPT_PATH/secret")
else
    echo "API token file not found. Please create a file named 'secret' in the same directory as this script."
    exit 1
fi

curl "${DATAVERSE_URL}/api/admin/datasetfield/loadNAControlledVocabularyValue"
# TODO: The "@" is confusing. Consider switching to --upload-file citation.tsv
#curl "${DATAVERSE_URL}/api/admin/datasetfield/load" -X POST --data-binary @"$SCRIPT_PATH"/data/metadatablocks/custom_hbgdki.tsv -H "Content-type: text/tab-separated-values" #works
#curl "${DATAVERSE_URL}/api/admin/datasetfield/load" -X POST --data-binary @"$SCRIPT_PATH"/data/metadatablocks/crc1678.tsv -H "Content-type: text/tab-separated-values" #fails
#curl http://localhost:8080/api/admin/datasetfield/load -H "Content-type: text/tab-separated-values" -X POST --upload-file $SCRIPT_PATH/data/metadatablocks/crc1678.tsv #fails
# Enable uploaded block - with admin API token
#curl -H "X-Dataverse-key:$API_TOKEN" -X POST -H "Content-type:application/json" -d "[\"crc1678\"]" http://localhost:8080/api/dataverses/:root/metadatablocks
# upload test.tsv
#curl http://localhost:8080/api/admin/datasetfield/load -H "Content-type: text/tab-separated-values" -X POST --upload-file scripts/api/data/metadatablocks/test.tsv
# upload crc16879.sample_level.tsv
curl http://localhost:8080/api/admin/datasetfield/load -H "Content-type: text/tab-separated-values" -X POST --upload-file scripts/api/data/metadatablocks/crc1678.sample_level.tsv
