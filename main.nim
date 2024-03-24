import std/strutils


# Roll a die. Choose the # of sides and rolls. See how far from center.

echo "How many-sided die? (2 to 20) "
let sidesInput: string = readLine(stdin)
let sides: int = parseInt(sidesInput)

echo "You chose a ", sides, " sided die."
echo "How many times do you want to roll it?"

let rolls: int = parseInt(readLine(stdin))
echo "You chose to roll the ", sides, " sided die ", rolls, " times."


proc getNumberFromUser(min: int8, max: int8, question: string): int8 =
    # These will store the chosen number after the checks
    var chosenNumber: int8 = min - 1
    var chosenNumberString = chosenNumber

    # check input against range of allowed inputs
    while chosenNumber < min:
        echo question
        var userInput = readLine(stdin)
        for i in min .. max:
            if userInput == intToStr(i):
                chosenNumberString = i
                chosenNumber = int8(chosenNumberString)
                return chosenNumber
            elif i >= max:
                echo "Input out of range. Please choose again. "

    return chosenNumber

let newSide: int8 = getNumberFromUser(5, 7, "How many newside? ")
echo "You chose ", newSide
