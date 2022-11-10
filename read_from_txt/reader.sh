#!/bin/bash

LATEST_RELEASE=$(git tag | sort -V | tail -1)

echo BASH GIT TOOLS $LATEST_RELEASE

doCalulations() {  
read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo will perform the calculations, please wait a while
        echo press any key to exit...
esac
}

spinner() {
    local i sp n
    sp='/-\|'
    n=${#sp}
    printf ' '
    while sleep 0.1; do
        printf "%s\b" "${sp:i++%n:1}"
    done
}

printf 'Doing important work [coffe time]...'
spinner &

sleep 1  # sleeping for 10 seconds is important work

kill "$!" # kill the spinner
printf '\n'


#read the lines as array with delemiter as ','
# declaring array list and index iterator
declare -a array=()
i=0

# reading file in row mode, insert each line into array
while IFS= read -r line; do
    array[i]=$line
    let "i++"
    # reading from file path
done < inputs.txt

for line in "${array[@]}"
  do
    VAL=$( echo $line | cut -d "=" -f2  | sed 's/^.//;s/.$//' )
    if [[ -z "VAL" ]]
    then
    echo "Empty"
    else
        echo $VAL
    fi
  done



# read -p 'To whom do I have the pleasure?: ' name

# read -p 'Hello $name It is a pleasure. Please let me know your height: ' height

# read -p $name', please let me know your weight: ' weight

# read -p $name', please let me know your age: ' age



