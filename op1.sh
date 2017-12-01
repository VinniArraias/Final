#!/bin/bash

opcao(){
clear

OPCAO=$(dialog --stdout				\
	--title 'LISTAR'			\
	--menu 'Escolha uma opção'		\
	0 0 0					\
	"1" 'Listar localidade'			\
	"2" 'Listar itens'			\
	"3" 'Listar baixas'			\
	"4" 'Listar usuários cadastrados'	\
	"5" 'Voltar')


	if [[ $? == "1" ]]
        	         then
	                        cd /home/vinicius/Projeto/Invent-rio/

        	                source menu.sh $1
	fi


	if [[ $OPCAO == 1 ]]
		then
			OP=7
			source log.sh $OP
			source listar_loc.sh $1


	elif [[ $OPCAO == 2 ]]
		then
			OP=8
			source log.sh $OP
			source listar.sh $1

	elif [[ $OPCAO == 3 ]]
		then
			cd /home/vinicius/Projeto/Invent-rio/registros/$1/
			arquivo="baixas.csv"

			dialog				\
				--title 'Baixas'	\
				--textbox $arquivo	\
				0 0

			cd /home/vinicius/Projeto/Invent-rio/

			opcao $1

	elif [[ $OPCAO == 4 ]]
		then
			listar(){

				cd /home/vinicius/Projeto/Invent-rio/registros/
 
				le=$(less users)

			dialog                          \
        			--title 'Lista'         \
        			--textbox users         \
         			0 0

				cd /home/vinicius/Projeto/Invent-rio/

				opcao $1
}

		listar $1

	elif [[ $OPCAO == 5 ]]
		then
			source menu.sh $1

	else
		source menu.sh $1
		
fi 


}

opcao $1
