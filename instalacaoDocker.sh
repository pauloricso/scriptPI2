#!/bin/bash

function instacaoDocker() {
    clear
    echo "Deseja instalar o docker ? y or n"
    read answerInstallation

    if [ "$answerInstallation" == "y" ]; then
        clear 
        echo -e "OK !\ninstalando...\n"
        
        sudo apt install docker.io      

        sudo systemctl start docker

        sudo systemctl enable docker

        docker -v

        if [ $? -eq 0 ]; then 
            echo "Docker instalado com sucesso"
        else 
            echo "Erro na instalação do docker"
        fi
    fi

}

instacaoDocker