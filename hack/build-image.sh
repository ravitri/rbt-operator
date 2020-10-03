#!/usr/bin/env bash
set -eu

export OPERATOR_NAME="rbt-operator"
export REPO_NAME="quay.io/travi"
export VERSION=$(cat version/version.go | grep -w Version | awk -F"=" '{ print $2 }' | tr -d "\" ")
export IMAGE_NAME=$REPO_NAME/$OPERATOR_NAME:v$VERSION

echo "Building image $IMAGE_NAME"

# Build and push the app-operator image to a public registry such as quay.io
operator-sdk build ${IMAGE_NAME} --image-builder podman --verbose
podman push ${IMAGE_NAME}

# Update the operator manifest to use the built image name
sed -i "s|REPLACE_IMAGE|${IMAGE_NAME}|g" deploy/operator.yaml
