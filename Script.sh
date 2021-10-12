#!/bin/bash
docker stop Prod || true
docker rm Prod || true
docker rmi docker-tomcat-webapp || true
docker build -t docker-tomcat-webapp .
docker run --name Prod -d -p 8090:8080 -t docker-tomcat-webapp:latest
