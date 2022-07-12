#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE TABLE teams,games;")"

##first we will read the file to add the teams
while IFS=, read -r year round winner opponent winnergoals opponentgoals
do
if [[ $year != "year" ]]
then
    #echo "$year $round $winner $opponent $winnergoals $oppoonentgoals"
    result1=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    #echo $result1
    result2=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    #echo $result2
    if [[ $result1 == '' ]]
    then
    echo "We will add team $winner to the table"
    insert=$($PSQL "INSERT INTO teams(name) VALUES ('$winner')")
    echo $insert
    fi
    if [[ $result2 == '' ]]
    then
    echo "We will add team $opponent to the table"
    insert=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent')")
    echo $insert
    fi
fi
done < games.csv

##next we will add the games
while IFS=, read -r year round winner opponent winnergoals opponentgoals
do
if [[ $field1 != "year" ]]
then
  result1=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    #echo $result1
  result2=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    #echo $result2    
  if [[ $result1 != '' && $result2 != "" ]]
  then
    echo "We will add the game to the table"
    insert=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($year,'$round',$result1, $result2, $winnergoals, $opponentgoals)")
    echo $insert
  fi
fi
  done < games.csv
