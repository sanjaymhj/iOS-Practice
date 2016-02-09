import Foundation

var board: [[String]] = [["-","-","-"],["-","-","-"],["-","-","-"]]

var player1Notation:String! = "X"
var player2Notation:String! = "O"
var allInputs:[String] = [String]()
var currentPlayer:Int! = 0
var win:Bool! = false
var exit:Bool! = false
var player1Score:Int = 0
var player2Score:Int = 0
var totalGames:Int = 0


func printBoard(){
  for row in board{
    for item in row{
      print("\t\(item)\t|", terminator:"")
    }
    print("")
  }
  print("\(allInputs.count)")
}

func updateBoard(playerNotation:String , input:String){
  switch(input){
    case "1":
      board[2][0] = playerNotation
      break;
    case "2":
      board[2][1] = playerNotation
      break;
    case "3":
      board[2][2] = playerNotation
      break;
    case "4":
      board[1][0] = playerNotation
      break;
    case "5":
      board[1][1] = playerNotation
      break;
    case "6":
      board[1][2] = playerNotation
      break;
    case "7":
      board[0][0] = playerNotation
      break;
    case "8":
      board[0][1] = playerNotation
      break;
    case "9":
      board[0][2] = playerNotation
      break;
    default:
      break;
    }
}

func isInputValid(input: String) -> Bool {
  for place in allInputs{
    if(place == input){
      return false
    }
  }
  if(Int(input)<1 && Int(input)>9) {
    print("wrong input \(input)")
    return false
  }
  return true
}

//Check for winning condition
func checkWin(playerNotation: String) -> Bool {
  for i in 0...2 {
    if (board[i][0] == playerNotation && board[i][1] == playerNotation && board[i][2] == playerNotation) {
        return true;
        }
    if (board[0][i] == playerNotation && board[1][i] == playerNotation && board[2][i] == playerNotation) {
        return true;
      }
    }
    if (board[0][0] == playerNotation && board[1][1] == playerNotation && board[2][2] == playerNotation) {
        return true;
    }
    if (board[0][2] == playerNotation && board[1][1] == playerNotation && board[2][0] == playerNotation) {
        return true;
    }
    return false;
}

//main game loop
func play(){
  totalGames++
  repeat {
    print("Player \(currentPlayer+1) > ", terminator:"")
    if let input = readLine(){
      if(isInputValid(input)){
        currentPlayer = (currentPlayer+1)%2
        allInputs.append(input)
        if(currentPlayer == 1){
          updateBoard(player1Notation, input: input)
            if(checkWin(player1Notation)) {
            print("\n\t********** Player 1 Wins ***********")
              win = true
              player1Score++
            }
          }
        else{
          updateBoard(player2Notation, input: input)
          if(checkWin(player2Notation)) {
            print("\n\t********** Player 2 Wins ***********")
            win = true
            player2Score++
            }
          }
        }
      }
    printBoard()
  } while( allInputs.count < 9 && !win)
}

//change notation to be put in board
func changePlayerNotation() {
  print("For Player 1")
  print("Notation > ",terminator : "")
  if let choice = readLine(){
    player1Notation = choice
  }
  print("For Player 2")
  print("Notation > ",terminator : "")
  if let choice = readLine(){
    player2Notation = choice
  }

}

//Instruction to play
func showInstruction() {
  print("Use Number Pad to put the mark on the board.")
  print("\t|\t7\t|\t8\t|\t9\t|")
  print("\t|\t4\t|\t5\t|\t6\t|")
  print("\t|\t1\t|\t2\t|\t3\t|")
  print("")
  print("")
  print("")
}

//show LeaderBoard
func showLeaderBoard(){
  print("\tThe leader Board")
  print("---------------------------------")
  print("Total Game - \(totalGames)")
  print("\tPlayer 1 won \(player1Score) games.")
  print("\tPlayer 2 won \(player2Score) games.")
}

//main game loop
repeat{
  print("\t******* Lets Palay Swiftic-tac-tow *******")
  print("")
  print("\t-------- Menu --------")
  print("\t1.\tPlay")
  print("\t2.\tChange Player Notation")
  print("\t3.\tInstruction")
  print("\t4.\tLeaderBoard")
  print("\t5.\tExit")
  if let choice = readLine(){
    switch(choice) {
      case "1":
        play()
      case "2":
        changePlayerNotation()
      case "3":
        showInstruction()
      case "4":
        showLeaderBoard()
      default:
        exit = true
        break
    }
  }
} while(!exit)
