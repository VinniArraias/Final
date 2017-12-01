#!/bin/bash

dir="/usr/share/Invent-rio"

validacao(){

	if [[ $OPCAO == 1 ]]
		then
			clear

			#echo "Para sair do arquivo a seguir, pressione a tecla q"
			#read -p "Agora, pressione [enter]" ENTER

			le=$(less sys_log)

			#tail -f sys_log > out &
			dialog					\
			--title 'Sistema de log'		\
			--textbox sys_log			\
			0 0

			mais_opcoes $2

	elif [[ $OPCAO == 2 ]]
		then
			clear

			#echo "Abrir documentação"
			#sleep 3

			dialog					\
				--title 'Documentação'		\
				--msgbox "Documentação..."	\
				0 0
			mais_opcoes $2

	elif [[ $OPCAO == 3 ]]
		then
			clear
			source menu.sh $2

	else
		#read -p "Opção inválida! Pressione [enter] para voltar." ENTER

		dialog				\
		--title 'Inválido!'		\
		--msgbox 'Opção inválida!'	\  
		0 0

		mais_opcoes $2

		fi
}


mais_opcoes(){
cd $dir


OPCAO=$(dialog --stdout						\
	--title 'Mais opções'					\
	--menu 'Escolha uma opção: '				\
	0 0 0							\
	"1" 'Listar log'					\
	"2" 'Ajuda'						\
	"3" 'Voltar')

if [[ $? == "1" ]]
                 then
                        cd $dir
 
                        source menu.sh $1
fi

validacao $OPCAO $1
}


mais_opcoes $1
