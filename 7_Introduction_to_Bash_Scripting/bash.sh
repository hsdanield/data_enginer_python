echo -e "Tomate\nAbacaxi\nBanana\nMelão\nBanana" > data/frutas.txt


echo "Numero de Palavras Tomate ou Melão"
cat data/frutas.txt | grep -E "Tomate|Melão" | wc -w