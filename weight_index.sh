#!/bin/bash

brocaFormulaCalculation() {
    result=$(($1 - 100))
    echo "Your ideal weight should be based on Broca's formula: $result kg"
}

pendeFormulaCalculation() {
    result=$(($2 / 2,4))
    echo "Your ideal weight should be based Pendes formula: $result kg"
}

imc1Calculation() {
    result=$(( $2 * $2 * 21,75  ))
    echo "Your ideal weight should be based IMC formula: $result kg"
    echo below you can also find you min and max weight
}


imc2Calculation() {
    result=$(( $2 / $1  ))
    echo "Your ideal weight should be based IMC2 formula: $result kg"
}

echo Welcome to the weight index calculator v 0.1


doCalulations() {  

read -r -p "Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        echo will perform the calculations, please wait a file

        brocaFormulaCalculation $1 $2 $3

        pendeFormulaCalculation $1 $2 $3

        lorenzFormulaCalculation $1 $2 $3

        lorenz2FormulaCalculation $1 $2 $3

        heightAgeFormulaCalculation $1 $2 $3

        creffFormulaCalculation $1 $2 $3

        monerotFormmulaCalculation $1 $2 $3

        bornHartFormulaCalculation $1 $2 $3

        imc1Calculation $1 $2 $3

        imc2Calculation $1 $2 $3
        echo press any key to exit...
    
esac
}



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
    echo "$line"
  done

  doCalulations ${array[1]} ${array[2]} ${array[3]}

# read -p 'To whom do I have the pleasure?: ' name

# read -p 'Hello $name It is a pleasure. Please let me know your height: ' height

# read -p $name', please let me know your weight: ' weight

# read -p $name', please let me know your age: ' age



