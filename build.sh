#!/usr/bin/env bash

# this script is for building and pushing the docker repos
# useage:
#
# ./build.sh <version> <repo>
#
# repo: dockerhub | eccd

version=${1}
repo=${2}

if [ "${version}" == "" ] ; then
  echo "specify version"
  echo "usage: ./build.sh <version> <repo>"
  exit
fi

if [ "${repo}" == "dockerhub" ] ; then
  netcat_image="geerd/netcat:${version}"
  receive_udp_image="geerd/receive-udp:${version}"
else
  netcat_image="k8s-registry.eccd.local/netcat:${version}"
  receive_udp_image="k8s-registry.eccd.local/receive-udp:${version}"
fi

echo "building docker containers with version ${version}" 
docker build -f ./Dockerfile.sent-udp -t "${netcat_image}" .
docker build -f ./Dockerfile.receive -t "${receive_udp_image}" .

echo "pushing containers to repo with version ${version}"
docker push "${netcat_image}"
docker push "${receive_udp_image}"