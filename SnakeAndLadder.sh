#!/bin/bash -x

echo "Welcome To Snake And Ladder!!"

WinPos=100
StartPos=0

Dice=$(( 1 + $RANDOM%6 ))
echo $Dice
move_type=`shuf -n 1 -e LADDER SNAKE NOPLAY`

checkOption(){
	case $move_type in
			NOPLAY)echo $(($1+0));;
			LADDER)echo $(($1+Dice));;
			SNAKE) echo $(($1-Dice));;
	esac
}
