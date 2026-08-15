#!/bin/bash

#  MIT License
#
#  Copyright (c) 2026 Dudu-gsh
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.

clear

echo "Ola e bem vindo ao meu menu"
sleep 1
echo "Hello and welcome to my menu"
sleep 1
echo "Escolha uma lingua"
echo "Chosse one language"
echo ""
echo "1) English "
echo "2) Portugues"
echo ""
echo "Aviso,quando for escrever,escreva 1 pra portugues ou 2 pra ingles"
sleep 1
echo "Warnig,when your gonna wtite,write 1 for portuguese or 2 for english"
sleep 1
read -rp "Escreva  /  Write:" lang

if [[ $lang == 1 ]]; then
echo "Voce vai querer adicionar KernelSU ao seu kernel?"
read -rp "(S/N)" IDK

    if [[ $IDK == s ]]; then
        echo "Okay"
        chmod +x lineageos23pt.sh
        ./lineageos23pt.sh --KERNELSU
    fi

echo "Bem vindo ao meu lineageos 23 builder"
chmod +x $(pwd)/lineageos23pt.sh
./lineageos23pt.sh
echo "Agora voce tem um build do lineageos 23"
exit 0

elif [[ $lang == 2 ]]; then 
echo "Welcome to my lineageos 23 builder"
echo "You want to add KernelSU to ypur Kernel?"
read -rp "(Y/N)"
    if [[ $IDK == s ]]; then
        echo "Okay"
        chmod +x lineageos23en.sh
        ./lineageos23en.sh --KERNELSU
    fi

chmod +x lineageos23en.sh
./lineageos23en.sh
echo "Now you have a build of lineageos 23"
else 
echo "Nao entendi meu fi."
echo "I dont understand"
