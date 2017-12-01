#!/bin/bash

dir_initial=$(pwd)


cd /home/ #vai para o home
mkdir vinicius #cria o diretório vinicius

chmod 777 vinicius #todos os direitos para /vinicius/


cd /home/vinicius/
mkdir Projeto

chmod 777 Projeto/


cd /home/vinicius/Projeto/
mkdir Invent-rio

chmod 777 Invent-rio/


cd /home/vinicius/Projeto/Invent-rio/
mkdir registros

chmod 777 registros/
cd ..


dir_final=$(pwd)


cd $dir_initial

mv $dir_initial $dir_final
cd $dir_final

echo "Instalação finalizada com sucesso!"
echo "O diretório deste programa está em $dir_final"
echo "Para executar este programa, você:"
echo
echo "1) Deve estar no diretório $dir_final;"
echo "2) Deverá digitar ./ ou bash no arquivo login.sh;"
echo "3) De preferência, sempre execute o programa como Super Usuário;"
echo
echo "Qualquer erro, contate-nos: empresasenai@example.com"
