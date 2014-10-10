#!/bin/bash -e
VERSION=`cat VERSION`
TAG="shippableimages/ubuntu1204_clojure:$VERSION"
echo "Building $TAG"
docker build --rm -t $TAG .
