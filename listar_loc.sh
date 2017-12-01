#!/bin/bash

listar(){
clear

cd /home/vinicius/Projeto/Invent-rio/registros/


dialog					\
	--title 'Listagem'		\
	--textbox listagem		\
	0 0

#echo "Para sair do arquivo a seguir, pressione a tecla q"
#read -p "Agora, pressione [enter]" ENTER


#less listagem
clear

cd /home/vinicius/Projeto/Invent-rio/

source op1.sh $1

}

listar $1 
