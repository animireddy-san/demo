#!/bin/sh

REGISTRY="trialb0g5ms.jfrog.io"
REPO="seh-docker"
IMAGE="demo"

echo "Logging in to Docker registry..."
docker login "$REGISTRY"

echo "Finding latest image tag..."
LATEST_TAG=$(docker images "$REGISTRY/$REPO/$IMAGE" \
  --format '{{.Tag}}' | sort -V | tail -n 1)

echo "Latest Image Tag: $LATEST_TAG"

echo "Pulling image..."
docker pull "$REGISTRY/$REPO/$IMAGE:$LATEST_TAG"
