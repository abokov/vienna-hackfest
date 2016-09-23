#!/bin/bash
docker pull docker.bokov.net/abokov-demo:latest  
docker stop abokov-demo  
docker rm abokov-demo
docker rmi docker.bokov.net/abokov-demo:current  
docker tag docker.bokov.net/abokov-demo:latest docker.bokov.net/abokov-demo:current  
docker run -d --name abokov-demo docker.bokov.net/abokov-demo:latest  

