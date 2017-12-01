#!/bin/bash

opcao(){
clear

#echo "1) Cadastrar localidade"
#echo "2) Cadastrar item"
#echo "3) Voltar"
#echo
#read -p "Entre com uma opção: " OPCAO

OPCAO=$(dialog --stdout				\
	--title 'CADASTRAR'			\
	--menu 'Escolha uma opção: '		\
	0 0 0					\
	"1" 'Cadastrar localidade'		\
	"2" 'Cadastrar item'			\
	"3" 'Cadastrar usuário'			\
	"4" 'Voltar'				)

if [[ $? == "1" ]]
                then
                        cd /home/vinicius/Projeto/Invent-rio/

                        source menu.sh $1
fi



	if [[ $OPCAO == 1 ]]
		then
			OP=9
			source log.sh $OP
			source novo.sh $1

	elif [[ $OPCAO == 2 ]]
		then
			OP=10
			source log.sh $OP
			source adicionar_eq.sh $1

	elif [[ $OPCAO == 3 ]]
		then
			new_user(){
exec 3>&1
 
VALUES=$(dialog --ok-label "Cadastrar"				\
	--backtitle "Linux User Managment"			\
	--title "CADASTRAR"					\
	--form "Entre com os dados a seguir:"			\
	15 50 0							\
	"Nome                    :" 1 1 "" 1 26 19 0		\
	"Senha                   :" 2 1 "" 2 26 19 0		\
	"Digite a senha novamente:" 3 1 "" 3 26 19 0		\
	2>&1 1>&3)

exec 3>&-

i=1
IFSold=$IFS
export IFS="
"
for valores in $VALUES;do
case $i in
1)NOME="$valores";;
2)SENHA="$valores";;
3)SSENHA="$valores";;
esac
i=`expr $i + 1`
done
export IFS="$IFSold"


if [[ $NOME == "" ]]
                then

                        dialog                                  \
                                --title 'Inválido'              \
                                 --msgbox 'Nome inválido'        \
                                0 0

                        opcao $1
fi

 
        if [[ $SENHA != $SSENHA ]]
                 then
                        #echo "Senhas não conferem"
                         #read -p "Pressione [enter] para retornar" ENTER

                        dialog                                  \
                                --title 'Inválido'              \
                             --msgbox 'Senhas não conferem.' \
                                0 0
                        opcao $1
fi


cd /home/vinicius/Projeto/Invent-rio/registros/

grep $NOME users.csv 

         if [[ $? == 0 ]]
                 then
                         clear
 
                         dialog                                          \
                                 --title 'Usuário'                       \
                                 --msgbox "Usuário ($NOME) já existe."   \
                                 0 0
		opcao $1
fi

HASH_PASS=$(echo $SENHA | sha256sum | cut -d" " -f1)
 

INFO="$NOME;$HASH_PASS"
 
echo $INFO >> users.csv

USERx=$(grep $NOME users.csv)
USER=$(echo $USERx | cut -d";" -f1)
 
echo $USER >> users
 
#echo "Usuário cadastrado com sucesso!"
 #read -p "Pressione [enter] para continuar" ENTER
 
 dialog                                                          \
        --title 'Sucesso!'                                      \
        --msgbox "Usuário ($NOME) cadastrado com sucesso!"      \
         0 0
 
 
cd /home/vinicius/Projeto/Invent-rio/
 
opcao $1
 
}

	new_user $1

	elif [[ $OPCAO == 4 ]]
		then
			source menu.sh $1

	else
		#echo "Opção inválida!"
		#read -p "Pressione [enter] para voltar" ENTER

		dialog 							\
			--title 'Opção inválida'
			--msgbox 'Pressione [enter] para voltar.'	\
			0 0


		opcao $1
fi


}

opcao $1
