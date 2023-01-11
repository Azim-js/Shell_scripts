#!/bin/bash 

# shebang script header

# Display 'Hello'
echo " Hello"

# Assign a value to a variable 

WORD='script'

# Display that value using the vqariable

echo "$WORD"

# Demonstrate that single qoutes case variables to not get expanded 

echo '$WORD'

# Combine the variable with hard-coded text 

echo "This is a shell ${WORD}"

# Append text to the variable 

echo "${WORD}ing is fun!!!"

# Show how NOT to append text to a variable

echo "$WORDing is fun!!"

# Creating a new variable 
ENDING='ed'

echo "This is ${WORD}${ENDING}"

# change the value stored in the Ending Variable 

ENDING='ing'

echo "${WORD}${ENDING} is fun!"

# Reassign value to Ending

ENDING='s'

echo "You are going to write many ${WORD}${ENDING} in This Class"
