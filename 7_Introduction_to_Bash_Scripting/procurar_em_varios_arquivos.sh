# Echo the first ARGV argument
echo $@ 

# Cat all the files
# Then pipe to grep using the first ARGV argument
# Then write out to a named csv using the first ARGV argument
cat data/hire_data/*.csv | grep "$@" > data/hire_data_modify/"$1".csv
