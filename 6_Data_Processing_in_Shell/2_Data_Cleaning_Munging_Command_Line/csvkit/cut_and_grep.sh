#Nome das culunas
csvcut -n Spotify_MusicAttributes.csv

#Selecionando Colunas Por nome
csvcut -c "COL_A","COL_B" Spotify_MusicAttributes.csv
#Selecionando Colunas por indice
csvcut -c 1,2 Spotify_MusicAttributes.csv


#Procurando um valor para a coluna tra_id
csvgrep -c "track_id" -m 118GQ70Sp6pMqn6w1oKuki Spotify_MusicAttributes.csv

# Pegando as 15 primeiras linhas da coluna 2 em ordem e gravando em um novo arquivo
csvsort -c 2 Spotify_Popularity.csv | head -n 15 > Spotify_Popularity_Top15.csv