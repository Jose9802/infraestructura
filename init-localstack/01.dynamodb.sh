#!/bin/bash

awslocal dynamodb create-table \
    --table-name Organizations \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
        AttributeName=user,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --global-secondary-indexes '[
        {
            "IndexName": "UserIndex",
            "KeySchema": [
                {"AttributeName":"user","KeyType":"HASH"}
            ],
            "Projection": {"ProjectionType":"ALL"},
            "ProvisionedThroughput": {"ReadCapacityUnits":5,"WriteCapacityUnits":5}
        }
    ]'
awslocal dynamodb create-table \
    --table-name Sessions \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
        AttributeName=refresh,AttributeType=S \
        AttributeName=user,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --global-secondary-indexes '[
        {
            "IndexName": "RefreshIndex",
            "KeySchema": [
                {"AttributeName":"refresh","KeyType":"HASH"}
            ],
            "Projection": {"ProjectionType":"ALL"},
            "ProvisionedThroughput": {"ReadCapacityUnits":5,"WriteCapacityUnits":5}
        },
        {
            "IndexName": "UserIndex",
            "KeySchema": [
                {"AttributeName":"user","KeyType":"HASH"}
            ],
            "Projection": {"ProjectionType":"ALL"},
            "ProvisionedThroughput": {"ReadCapacityUnits":5,"WriteCapacityUnits":5}
        }
    ]'
awslocal dynamodb update-time-to-live \
    --table-name Sessions \
    --time-to-live-specification "Enabled=true,AttributeName=ttl"
