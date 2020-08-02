#!/bin/bash

echo "Welcome To Snake And Ladder!!"

WinPos=100
StartPos=0
#To store the count of no. of timed dice thrown
dice1count=0
dice2count=0
#To store the movement of player position
TempPos=0
#Initializing Player One & Player Two
PlayerOnePos=$(($StartPos))
PlayerTwoPos=$(($StartPos))

rolleddice(){
Dice=$(( 1 + $RANDOM%6 ))
move_type=`shuf -n 1 -e LADDER SNAKE NOPLAY`
}
#calling a function to move positions.
checkOption(){
	case $move_type in
			NOPLAY)echo $(($1+0));;
			LADDER)echo $(($1+Dice));;
			SNAKE) echo $(($1-Dice));;
	esac
}

PlayOne(){
rolleddice
((dice1count++))
TempPos=$(checkOption $PlayerOnePos)
PlayerOnePos=$(($TempPos))
if [ $PlayerOnePos -eq $WinPos ]
then
	echo "Player One wins after throwing dice $dice1count times"
	exit
elif [ $PlayerOnePos -gt $WinPos ]
then
	#echo "Player One is currently at $PlayerOnePos after throwing $dice1count times"
     	PlayerOnePos=$(($PlayerOnePos-$Dice))
elif [ $PlayerOnePos -lt $StartPos ]
then
   PlayerOnePos=$(($StartPos))
fi
echo "PLAYER ONE IS AT $PlayerOnePos"
}

PlayTwo(){
rolleddice
((dice2count++))
TempPos=$(checkOption $PlayerTwoPos)
PlayerTwoPos=$(($TempPos))
if [ $PlayerTwoPos -eq $WinPos ]
then
echo "Player Two wins after throwing $dice2count times"
exit
elif [ $PlayerTwoPos -gt $WinPos ]
then
echo "Player Two is currently at $PlayerTwoPos after throwing $dice2count times"
     PlayerTwoPos=$(($PlayerTwoPos-$Dice))
elif [ $PlayerTwoPos -lt $StartPos ]
then
   PlayerTwoPos=$(($StartPos))
fi
echo "PLAYER TWO IS AT $PlayerTwoPos"
}

playerone(){
	while [ $PlayerOnePos -lt $WinPos ]
	do
   		PlayOne
		while [ $move_type == "LADDER" ]
		do
	   	PlayOne
        	done
	        playertwo
       done
}

playertwo(){
	while [ $PlayerTwoPos -lt $WinPos ]
	do
   		PlayTwo
		while [[ $move_type == "LADDER" ]]
		do
                PlayTwo
       done
        playerone
       done
}
playerone


