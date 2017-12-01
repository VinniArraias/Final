#!/bin/bash
clear

deslogar(){

cd /home/vinicius/Projeto/Invent-rio/

OPCAO=$(dialog --stdout				\
	--title 'Sair'				\
	--menu 'Você deseja...'			\
	0 0 0					\
	"1" 'Encerrar sessão'			\
	"2" 'Desligar'				\
	"3" 'Voltar')


if [[ $? == "1" ]]
                then
                        cd /home/vinicius/Projeto/Invent-rio/

                         source login.sh $1

fi

	if [[ $OPCAO == 1 ]]
		then
			source login.sh

	elif [[ $OPCAO == 2 ]]
		then
			clear
			echo "Good-bye..."
			exit 0

	else
		source menu.sh $1

fi

}

deslogar $1
