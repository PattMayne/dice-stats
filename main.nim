import std/strutils
import std/random

# Call randomize() once to initialize the default random number generator.
randomize()

proc getNumberFromUser(minInput: int32, maxInput: int32,
        question: string): int32 =
    let isMaxBigger = maxInput > minInput
    let min: int32 = if isMaxBigger: minInput else: maxInput
    let max: int32 = if isMaxBigger: maxInput else: minInput
    let rangeString: string = "($1 to $2) " % [intToStr(min), intToStr(max)]
    # "$1 eats $2." % ["The cat", "fish"]
    # These will store the chosen number after the checks
    var chosenNumber: int32 = min - 1
    var chosenNumberString = chosenNumber

    # check input against range of allowed inputs
    while chosenNumber < min:
        echo question, rangeString
        var userInput = readLine(stdin)
        for i in min .. max:
            if userInput == intToStr(i):
                chosenNumberString = i
                chosenNumber = int32(chosenNumberString)
                return chosenNumber
            elif i >= max:
                echo "Input out of range. Choose between ", min, " and ", max
    chosenNumber


# Roll a die. Choose the # of sides and rolls. See how far from center.
# let sidesInput: string = readLine(stdin)
let sides: int8 = int8(getNumberFromUser(2, 30, "How many-sided die? "))

echo "You chose a ", sides, " sided die."

let rolls: int32 = getNumberFromUser(1, 2000000,
        "How many times do you want to roll it? ")
echo "You chose to roll the ", sides, " sided die ", rolls, " times."

let highestPossibleSum: int = rolls * sides
let middleNumber = int(((highestPossibleSum - rolls) / 2)) + int(rolls)

echo "The lowest possible sum is: ", rolls
echo "The middle possible sum is: ", middleNumber
echo "The highest possible sum is: ", highestPossibleSum

# DO THE ROLL

var sum: int = 0

for i in 1 .. rolls:
    let roll = rand(1..int(sides))
    #echo "Roll ", i, " is a ", roll
    sum += roll

echo "Total of all rolls is ", sum

let absoluteDistanceFromCenter: int =
    if sum >= middleNumber: sum - middleNumber
        else: middleNumber - sum

echo "Absolute distance from center is ", absoluteDistanceFromCenter

let percentageFromCenter: int =
    int((absoluteDistanceFromCenter / highestPossibleSum) * 200)

echo "Percentage from center is ", percentageFromCenter
