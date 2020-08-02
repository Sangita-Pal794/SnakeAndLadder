#!/bin/bash -x

echo "Welcome To Snake And Ladder!!"

WinPos=100
StartPos=0
#To store the count of no. of timed dice thrown
dice1count=0
#To store the movement of player position
TempPos=0
PlayerOnePos=$(($StartPos))
rolleddice(){
Dice=$(( 1 + $RANDOM%6 ))
echo $Dice
move_type=`shuf -n 1 -e LADDER SNAKE NOPLAY`
}

checkOption(){
	case $move_type in
			NOPLAY)echo $(($1+0));;
			LADDER)echo $(($1+Dice));;
			SNAKE) echo $(($1-Dice));;
	esac
}

while [ $PlayerOnePos -lt $WinPos ]
do
rolleddice
((dice1count++))
TempPos=$(checkOption $PlayerOnePos)
PlayerOnePos=$(($TempPos))
done
echo "Player One is currently at $PlayerOnePos after throwing $dice1count times"
