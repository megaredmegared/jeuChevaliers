import Foundation
class Statistics {
    
    var playerOneNumbersOfMoves = [0, 0, 0]
    var playerTwoNumbersOfMoves = [0, 0, 0]

    func countMoves(teamNumber: Int, member: Int) {
        
        switch teamNumber {
        case 0:
            playerOneNumbersOfMoves[member] += 1
        case 1:
            playerTwoNumbersOfMoves[member] += 1
        default:
            break
        }
    }

    
    func displayInfoAttackOrHeal(teamNumber: Int, member: Int) -> String {
        switch teamNumber {
        case 0:
            if team.number[teamNumber].teamMembers[member].memberSpeciality == text.translation["Mage"]! {
                return "\(text.translation["has healed"]!) \(playerOneNumbersOfMoves[member]) \(text.translation["times"]!)"
            } else {
                return "\(text.translation["has attacked"]!) \(playerOneNumbersOfMoves[member]) \(text.translation["times"]!)"
            }
        case 1:
            if team.number[teamNumber].teamMembers[member].memberSpeciality == text.translation["Mage"]! {
                return "\(text.translation["has healed"]!) \(playerTwoNumbersOfMoves[member]) \(text.translation["times"]!)"
            } else {
                return "\(text.translation["has attacked"]!) \(playerTwoNumbersOfMoves[member]) \(text.translation["times"]!)"
            }
        default:
           return ""
        }
    }
    
    func displayResults() {
        
        if (team.number[1].teamMembers[0].life <= 0 && team.number[1].teamMembers[1].life <= 0 && team.number[1].teamMembers[2].life <= 0) {
            print("""
                
                *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
                
                            \(text.translation["The team"]!) \(team.number[0].teamName) \(text.translation["hasWon"]!)
                
                *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
                
                """)
        } else {
            print("""
                
                *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
                
                            \(text.translation["The team"]!) \(team.number[1].teamName) \(text.translation["hasWon"]!)
                
                *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
                
                """)
        }
        
        print("""
            
            \(text.translation["youPlayed"]!) \(gameTime) \(text.translation["minutes"]!) !!!
            
            \(team.number[0].teamName)
            
            \(playerOneNumbersOfMoves[0]) \(team.number[0].teamMembers[0].memberName) \(displayInfoAttackOrHeal(teamNumber: 0, member: 0))
            \(playerOneNumbersOfMoves[1]) \(team.number[0].teamMembers[1].memberName) \(displayInfoAttackOrHeal(teamNumber: 0, member: 1))
            \(playerOneNumbersOfMoves[2]) \(team.number[0].teamMembers[2].memberName) \(displayInfoAttackOrHeal(teamNumber: 0, member: 2))
            
            
            \(team.number[1].teamName)
            
            \(playerTwoNumbersOfMoves[0]) \(team.number[1].teamMembers[0].memberName) \(displayInfoAttackOrHeal(teamNumber: 1, member: 0))
            \(playerTwoNumbersOfMoves[1]) \(team.number[1].teamMembers[1].memberName) \(displayInfoAttackOrHeal(teamNumber: 1, member: 1))
            \(playerTwoNumbersOfMoves[2]) \(team.number[1].teamMembers[2].memberName) \(displayInfoAttackOrHeal(teamNumber: 1, member: 2))
            
            
            """)
    }
    
    
}
