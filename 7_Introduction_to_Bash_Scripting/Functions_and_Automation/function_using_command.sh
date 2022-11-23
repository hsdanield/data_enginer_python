# Create a function
function get_number_wins () {

  # Filter aggregate results by argument
  win_stats=$(cat data/soccer_scores.csv | cut -d "," -f2 | egrep -v 'Winner'| sort | uniq -c | egrep "$1")
  
  echo $win_stats
}

# Call the function with specified argument
get_number_wins=$(get_number_wins "Etar")

# Print out the global variable
echo "The aggregated stats are: $get_number_wins"
