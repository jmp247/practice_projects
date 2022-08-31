#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guessing_game -t --no-align -c"


echo "Enter your username:"


PLAY_GAME() {
COUNTER=1
echo $1
read GUESS
while ! [[ $GUESS =~ ^[0-9]*$ ]]
do
echo "That is not an integer, guess again:"
read GUESS
done

MULTIPLIER=3
TARGET=$(( $RANDOM*$MULTIPLIER/100 + 1 ))

while [[ $GUESS -ne $TARGET ]]
do
#echo "The target is $TARGET"
    if [[ $GUESS -lt $TARGET ]]
    then
    echo "It's higher than that, guess again:"
    else
    echo "It's lower than that, guess again:"
    fi
COUNTER=$(( $COUNTER + 1 ))
read GUESS
done
if [[ $GUESS -eq $TARGET ]]
then
echo "You guessed it in $COUNTER tries. The secret number was $TARGET. Nice job!"
#add outcome to database
ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
ADD_GAME=$($PSQL "INSERT INTO games(user_id,guesses) VALUES ($ID,$COUNTER)")
fi

#echo $TARGET

}


read USERNAME

USER_VERIFIED=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")

if [[ $USERNAME == $USER_VERIFIED ]]
then
#return user stats
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAME_COUNT=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id='$USER_ID'")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'")
echo "Welcome back, $USER_VERIFIED! You have played $GAME_COUNT games, and your best game took $BEST_GAME guesses."
PLAY_GAME "Guess the secret number between 1 and 1000:"
else
#add user to database
echo "Welcome, $USERNAME! It looks like this is your first time here."
ADD_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
PLAY_GAME "Guess the secret number between 1 and 1000:"
fi

