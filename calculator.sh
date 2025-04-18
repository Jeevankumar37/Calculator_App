#!/bin/bash

# Function to display menu
show_menu() {
  echo "----------------------------"
  echo "       Calculator Menu      "
  echo "----------------------------"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Exit"
  echo "----------------------------"
}

# Function to perform calculation
calculate() {
  case $choice in
    1)
      result=$(echo "$num1 + $num2" | bc)
      echo "Result: $num1 + $num2 = $result"
      ;;
    2)
      result=$(echo "$num1 - $num2" | bc)
      echo "Result: $num1 - $num2 = $result"
      ;;
    3)
      result=$(echo "$num1 * $num2" | bc)
      echo "Result: $num1 * $num2 = $result"
      ;;
    4)
      if [ "$num2" == "0" ]; then
        echo "Error: Division by zero is not allowed."
      else
        result=$(echo "scale=2; $num1 / $num2" | bc)
        echo "Result: $num1 / $num2 = $result"
      fi
      ;;
    5)
      echo "Exiting the calculator. Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Please choose between 1 to 5."
      ;;
  esac
}

# Main loop
while true; do
  show_menu
  read -p "Enter your choice [1-5]: " choice

  if [ "$choice" -ge 1 ] && [ "$choice" -le 4 ]; then
    read -p "Enter first number: " num1
    read -p "Enter second number: " num2
  fi

  calculate
  echo
done
