#!/usr/bin/env bash

param=${*:-1.1.1.1}
query=$(echo "$param" | sed 's/"/\\"/g')

curl -s -X 'POST' \
  'https://api.magnify.modat.io/service/search/v1' \
  -H 'accept: application/json' \
  -H 'Authorization: <API-KEY-HERE>' \
  -H 'Content-Type: application/json' \
  -d "{
  \"query\": \"$query\",
  \"page\": 1,
  \"page_size\": 10
}" | jq '.'
