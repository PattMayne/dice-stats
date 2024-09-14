import std/strutils
import std/random


#[
    Choose the number of sides of a die, and how many times to roll it.
    Calculate the maximum and minimum possible sums for the chosen numbers.
    Add the rolls together.
    Display how far we hit from middle of possible sums.
    Display both raw numbers and percentage.
]#

# Call randomize() once to initialize the default random number generator.
randomize()

# Prompt user to choose a number, then validate the number.
proc getNumberFromUser(minInput: int32, maxInput: int32,
        question: string): int32 =
    let isMaxBigger = maxInput > minInput
    let min: int32 = if isMaxBigger: minInput else: maxInput
    let max: int32 = if isMaxBigger: maxInput else: minInput
    let rangeString: string = "($1 to $2) " % [intToStr(min), intToStr(max)]

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
    sum += roll

echo "Total of all rolls is ", sum

let absoluteDistanceFromCenter: int =
    if sum >= middleNumber: sum - middleNumber
        else: middleNumber - sum

echo "Absolute distance from center is ", absoluteDistanceFromCenter

#[
    Display percentage from center (how far the sum of all rolls
    strayed from the middle of the range of possible sums)

    Only take the first five digits (or less) of the percentage:
    Make a string of the percentage, check its length,
    display a string of its length or else five digits,
    whichever is lower (so max five digits).

    The purpose is to demonstrate that the higher the number of rolls,
    the closer to the center it is likely to hit
]#
let percentageFromCenter: string =
    $((absoluteDistanceFromCenter / highestPossibleSum) * 200)

let indexOfFinalLetter: int = if percentageFromCenter.len() <
        5: percentageFromCenter.len() - 1 else: 4


let finalMessage: string = if indexOfFinalLetter > -1:
    $percentageFromCenter[0..indexOfFinalLetter] & "% from the middle. "
    else: "No percentage data"

echo finalMessage
