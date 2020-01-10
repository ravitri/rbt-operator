#!/usr/bin/env bash
set -eu

## Need to pass the name of the image to be built as argument
if [[ $# -eq 0 ]]
then
        echo "Please provide IMAGE_NAME as argument to this script"
        echo "Usage $0 <IMAGE_NAME>"
        exit 1
fi

export IMAGE_NAME=$1

# Build and push the app-operator image to a public registry such as quay.io
operator-sdk build ${IMAGE_NAME} --image-builder podman --verbose
podman push ${IMAGE_NAME}

# Update the operator manifest to use the built image name
sed -i "s|REPLACE_IMAGE|${IMAGE_NAME}|g" deploy/operator.yaml
