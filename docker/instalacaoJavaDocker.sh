#!/bin/bash

function instalacaoJavaContainer(){
    docker -v

    if [ $? -eq 0 ]; then 
        echo "instalando openJDK"
        sleep 2

        docker pull openjdk

    else 
         echo "ops Instale primeiro o Docker na VM"
    fi

}

instalacaoJavaContainer