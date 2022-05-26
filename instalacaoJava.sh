#!/bin/bash

function intalacaoJavaLocal(){
    clear 
    add-apt-repository ppa:webupd8team/java -y

    sleep 2
    sudo apt-get update -y
    sudo apt install openjdk-11-jre
    }

intalacaoJavaLocal