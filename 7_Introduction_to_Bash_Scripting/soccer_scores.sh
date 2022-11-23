# Create a single-line pipe
echo "Imprimindo winners unicos e contando a frequencia que aparecem"
cat data/soccer_scores.csv | cut -d "," -f 2 | tail -n +2 | sort | uniq -c

#!/bin/bash


echo "Gravando Novo arquivo > soccer_scores_edited, substituindo Cherno por Cherno City e Arda por Arda United"
cat data/soccer_scores.csv | sed 's/Cherno/Cherno City/g' | sed 's/Arda/Arda United/g' > data/soccer_scores_edited.csv

