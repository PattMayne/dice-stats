import std/strutils


# Roll a die. Choose the # of sides and rolls. See how far from center.

echo "How many-sided die? (2 to 20) "
let sidesInput: string = readLine(stdin)
let sides: int = parseInt(sidesInput)

echo "You chose a ", sides, " sided die."
echo "How many times do you want to roll it?"

let rolls: int = parseInt(readLine(stdin))
echo "You chose to roll the ", sides, " sided die ", rolls, " times."


proc getNumberFromUser(min: int8, max: int8): int8 = 
	var chosenNumber: int8 = min - 1
	while chosenNumber < min:
		echo "How many-sided die? (2 to 20) "
	return chosenNumber
