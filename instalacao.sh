#!/bin/bash

install_local(){

cd ..
cp -R Invent-rio /usr/share
ln -s /usr/share/Invent-rio/login.sh /usr/bin/Inventario &>/dev/null

instalacao
}


install_arquivo(){
dir="/usr/share/Invent-rio"
cd $dir

touch users.csv
touch user.csv
touch usersr2.csv
touch usersr.csv
touch listag
touch listagem

chmod 777 *

mkdir registros
chmod 777 registros/

cd $dir/registros/

cd $dir
}

install_local
install_arquivo
