## sql2csv 
### Sample syntax

sql2csv --db "sqlite:///SpotifyDatabase.db" \ 
        --query "SELECT * FROM Spotify_Popularity" \
        > Spotify_Popularity.csv