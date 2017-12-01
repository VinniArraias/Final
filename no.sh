#!/bin/bash

tail -f /home/vinicius/Projeto/Invent-rio/registros/Padrão/catg.csv > out &

dialog                                         \
   --title 'Monitorando Mensagens do Sistema'  \
   --tailbox out                               \
   0 0
