import std/strutils


proc getNumberFromUser(minInput: int8, maxInput: int8, question: string): int8 =
    let isMaxBigger = maxInput > minInput
    let min: int8 = if isMaxBigger: minInput else: maxInput
    let max: int8 = if isMaxBigger: maxInput else: minInput
    let rangeString: string = "($1 to $2) " % [intToStr(min), intToStr(max)]
    # "$1 eats $2." % ["The cat", "fish"]
    # These will store the chosen number after the checks
    var chosenNumber: int8 = min - 1
    var chosenNumberString = chosenNumber

    # check input against range of allowed inputs
    while chosenNumber < min:
        echo question, rangeString
        var userInput = readLine(stdin)
        for i in min .. max:
            if userInput == intToStr(i):
                chosenNumberString = i
                chosenNumber = int8(chosenNumberString)
                return chosenNumber
            elif i >= max:
                echo "Input out of range. Choose between ", min, " and ", max
    chosenNumber



# Roll a die. Choose the # of sides and rolls. See how far from center.
# let sidesInput: string = readLine(stdin)
let sides: int8 = getNumberFromUser(2, 20, "How many-sided die? ")

echo "You chose a ", sides, " sided die."
echo "How many times do you want to roll it?"

let rolls: int = parseInt(readLine(stdin))
echo "You chose to roll the ", sides, " sided die ", rolls, " times."


let newSide: int8 = getNumberFromUser(5, 14, "How many newside? ")
echo "You chose ", newSide
