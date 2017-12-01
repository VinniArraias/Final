#!/bin/bash

alterar(){

cd /home/vinicius/Projeto/Invent-rio/registros/

loc=$(for x in $(cat listagem) ; do
         echo $x ' -'
        done)
OPCAO=$(dialog --stdout --menu "Escolha uma localidade" 0 0 0 $loc)

if [[ $? == "1" ]]
                 then
                        cd /home/vinicius/Projeto/Invent-rio/
 
                        source menu.sh $1
fi

cd /home/vinicius/Projeto/Invent-rio/
source menu.sh $OPCAO


}

alterar $1
