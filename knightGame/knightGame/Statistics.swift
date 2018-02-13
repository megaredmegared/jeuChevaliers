import Foundation

/**
 Class for statistics to count the time elapsed during the game and the number of times a character has been chosen to attack or heal.
 */

class Statistics {
    
    /**
     Array to stock the number of times a player has been chosen for a move (attack or heal).
     */
    var playerNumbersOfMoves = [0, 0, 0]
    
    /**
     Incrementation of number of times a player has been chosen for a move (attack or heal).
     */
    
    func countMoves(teamNumber: Int, member: Int) {
        playerNumbersOfMoves[member] += 1
    }
    
    /**
     Display the text for a character with attack capacity or healing capacity.
     */
    
    func displayInfoAttackOrHeal(teamNumber: Int, member: Int) -> String {
        if team[teamNumber].teamMembers[member].memberSpeciality == text.translation["Mage"]! {
            return "\(text.translation["has healed"]!) \(playerNumbersOfMoves[member]) \(text.translation["times"]!)"
        } else {
            return "\(text.translation["has attacked"]!) \(playerNumbersOfMoves[member]) \(text.translation["times"]!)"
        }
    }
    
    /**
     Display winner of the game and the time played.
     */
    
    func displayWinner() {
        
        let teamNumber: Int
        
        if (team[1].teamMembers[0].life <= 0 && team[1].teamMembers[1].life <= 0 && team[1].teamMembers[2].life <= 0) {
            teamNumber = 0
        } else {
            teamNumber = 1
        }
        
        print("""
            
            *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
            
            \(text.translation["The team"]!) \(team[teamNumber].teamName) \(text.translation["hasWon"]!)
            
            *$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*$*
            
            \(text.translation["youPlayed"]!) \(gameTime) \(text.translation["minutes"]!) !!!
            
            
            """)
    }
    
    /**
     Display number of move per character.
     */
    
    func displayResults(teamNumber: Int) {
        
        print("""
            
            \(team[teamNumber].teamName)
            
            \(team[teamNumber].teamMembers[0].memberName) \(displayInfoAttackOrHeal(teamNumber: teamNumber, member: 0))
            \(team[teamNumber].teamMembers[1].memberName) \(displayInfoAttackOrHeal(teamNumber: teamNumber, member: 1))
            \(team[teamNumber].teamMembers[2].memberName) \(displayInfoAttackOrHeal(teamNumber: teamNumber, member: 2))
            
            
            """)
    }
}
