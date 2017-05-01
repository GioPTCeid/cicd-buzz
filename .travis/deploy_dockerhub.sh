#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t gioptceid_cicd-buzz:$TAG .
sudo docker tag gioptceid_cicd-buzz gtseres/gioptceid_cicd-buzz
docker push gtseres/gioptceid_cicd-buzz
