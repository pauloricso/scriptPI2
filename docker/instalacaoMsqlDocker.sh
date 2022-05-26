#!/bin/bash

function intalacaoMysqlDocker() {
    docker -v

    if [ $? -eq 0 ]; then
        echo "instalando Mysql"
        sleep 2
        sudo docker pull mysql:8
        sudo docker create -p 3306:3306 --name Mysql -e "MYSQL_DATABASE=farmagraphsolutions" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:8
        sudo docker cp ./tabelas.sql Mysql:docker-entrypoint-initdb.d/tabelas.sql
    else
         echo "ops Instale primeiro o Docker na VM"
    fi
}

intalacaoMysqlDocker