function verificarJavaVM(){
    java -version

    if [ $? -eq 0 ]; then
    
        echo "java já está intalado!!!"
    else
        echo "Deseja instalar o java??  -  y/n"
        read respostaJava
        
        if [ "$respostaJava" == "y" ]; then
           clear 
           echo "iniciando processo de instalação..."
           sleep 2

            chmod +x ./instalacaoJava.sh
           ./instalacaoJava.sh
        fi
    fi

    clear 
    echo "Deseja clonar o Jar executavel? y/n"
    read respostaCloneJar

    if [ "$respostaCloneJar" == 'y' ]; then
        git clone https://github.com/GUILHERMEPSANTOS/Java-Sem-interface.git
        
    fi

}

verificarJavaVM