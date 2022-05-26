#!/bin/bash

    echo "deseja clonar com CLI -- y/n?"
    read resposta

    if ["$resposta" == "y"]; then
    git clone https://github.com/rogerio-alvesf/Aplicacao-Java-Projeto-PI-2Sem.git
    else 
    git clone https://github.com/GUILHERMEPSANTOS/Java-Gui-pi.git
    fi