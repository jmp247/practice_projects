#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo "~~~Welcome to our Salon. What service would you like?~~~"

MAIN_MENU() {
#echo "ok"
SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id") 
#echo $SERVICES
echo "$SERVICES" | while read ID BAR NAME
do
 echo "$ID) $NAME"
done

read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

if [[ -z $SERVICE_NAME ]]
then
echo "Please make a valid selection:"
MAIN_MENU
else
#ask for phone number
echo "What is your phone number?"
read CUSTOMER_PHONE
#check if exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
#else ask for name, and time
if [[ -z $CUSTOMER_NAME ]]
then
echo "What is your name?"
read CUSTOMER_NAME
#enter customer
ADD_CUSTOMER=$($PSQL "INSERT INTO customers (name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
  if [[ $ADD_CUSTOMER ]]
  then 
  echo "Customer added"
  fi
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
echo "Select a time for your appointment:"
read SERVICE_TIME
ADD_TIME=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ('$SERVICE_ID_SELECTED','$CUSTOMER_ID','$SERVICE_TIME')")
SERVICE_CONFIRM="I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
SERVICE_FORMATTED=$(echo $SERVICE_CONFIRM | sed 's/ *//')
echo "$SERVICE_FORMATTED"
echo 

fi
}

MAIN_MENU "Please select one:"


