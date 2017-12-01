#!/bin/bash

cd /home/vinicius/Projeto/Invent-rio/registros/

loc=$(for x in $(cat listagem) ; do
	echo $x ' -'
	done)
op=$(dialog --stdout --menu "Escolha uma localidade" 0 0 0 $loc)

echo $op
