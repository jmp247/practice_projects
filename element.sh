#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
exit

else
#echo "Entered value $1"

  #check if $1 is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  #if yes, query by atomic number
  #ATOMIC_NUMBER=$($PSQL "SELECT name, symbol FROM elements WHERE atomic_number=$1;")
  ATOMIC_NUMBER=$1
  #echo "You selected $ATOMIC_NUMBER"
  #else, query by symbol/name
  else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1';")
  if [[ -z $ATOMIC_NUMBER ]]
  then
  ATOMIC_NUMBER=99999
  fi
  fi

ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/* [0-9]$//')
#echo "num formatted is $ATOMIC_NUMBER_FORMATTED"
PROPERTIES=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
if [[ -z $PROPERTIES ]]
then
echo "I could not find that element in the database."
else
echo "$PROPERTIES" | { read NAME PIPE SYMBOL PIPE TYPE PIPE MASS PIPE MELTING PIPE BOILING 
echo "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
}
fi

fi