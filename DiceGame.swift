import Foundation;

/**
 * My program rolls a random number between 1-6 for user to guess.
 *
 * @author  Kent Gatera
 * @version 1.0
 * @since   2024-Mar-8
 */

// Defining the error cases.
enum errorCases: Error {
      case invalidNumeral
}

func DiceGame()throws -> Int {
    // Random number generation and wrong guess list initialization.
    let maxNum = 6
    var falseGuesses: [Int] = []
    let randomNumber = Int.random(in: 1...maxNum)
    // Input prompt.
    print("What is your guess?: ", terminator: "")
    for _ in 1...maxNum {
        //The program gives you 6 tries.
        if let userInput = readLine(), let userTry = Int(userInput) {
            if userTry < randomNumber {
                print("Guess Higher.")
                falseGuesses.append(userTry)
            }
            if userTry > randomNumber {
                print("Guess Lower.")
                falseGuesses.append(userTry)
            }
            if userTry == randomNumber {
                print("You are correct!")
                print(falseGuesses)
                break
            }
        } else {
            // Raises "errorCases.invalidNumerals"
            throw errorCases.invalidNumeral
        }
    }
    return falseGuesses.count
}


do {

    let userGuessAmount = try DiceGame()

    print("You guessed wrong \( userGuessAmount) times.")

} catch {
      // Instructions for catch case.
    print("Please enter a valid integer amount 1-6.\n")
}
