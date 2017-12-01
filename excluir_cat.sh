#!/bin/bash
clear

verificacao(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir

if [[ -r $1 ]]
	then
		echo
	else
		#echo "$CATEGORIA inválida!"
		dialog				\
			--title 'Inválida'	\
			--msgbox "$1 inválida"	\
			0 0

		del $1
	fi

}


del(){
dir="/home/vinicius/Projeto/Invent-rio/registros/"
cd $dir


loc=$(for x in $(cat listagem) ; do
          echo $x ' -'
        done)
CATEGORIA=$(dialog --stdout --menu "Escolha uma localidade a se deletada:" 0 0 0 $loc)

if [[ $? == "1" ]]
                 then
                        cd /home/vinicius/Projeto/Invent-rio/
 
                        source op4.sh $1
fi

#cd /home/vinicius/Projeto/Invent-rio/
#source menu.sh $OPCAO


if [[ $OPCAO == 0 ]]
	then
		dir="/home/vinicius/Projeto/Invent-rio/"
		cd $dir

		source menu.sh $1
fi

CATEGORIAA=$1

	if [[ $CATEGORIA == $CATEGORIAA ]]
		then
			dialog														  \
			--title 'Localideade'												  \
			--msgbox 'Você não pode deletar esta categoria porque está logada nela; deslogue-se desta categoria pare deletar '\
			0 0

			del $1

	fi
cd /home/vinicius/Projeto/Invent-rio/registros/

verificacao $CATEGORIA

rm -rf $CATEGORIA

grep -Riv $CATEGORIA listagem > listag

cat listag > listagem

#echo "Localidade ($CATEGORIA) excluída com sucesso!"

#read -p "Pressione [enter] para retornar ao menu." ENTER

dialog									\
	--title 'Sucesso!'						\
	--msgbox "Localidade ($CATEGORIA) excluída com sucesso!"	\
	0 0

clear

dir="/home/vinicius/Projeto/Invent-rio/"
cd $dir
}

del $1
