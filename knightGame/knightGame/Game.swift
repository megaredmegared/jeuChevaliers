
import Foundation

/// Game Logic.

class Game {
    var runGame = true // Game parameter to trigger the game.
    var bonus = Bonus()
    
    /// Display starting menu.
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // Start to play.
                text.usedNames = [""] // Empty the collected teams and characters names for an new game.
                team = [Team(name: ""), Team(name: "")] // Empty the teams for an new game.
                playersStatistics = [Statistics(), Statistics()] // Empty the statistics for an new game.
                gameTime = 0 // Empty the statistic of game time for an new game.
                
                print(team[0].teamName)
                print(team[0].teamMembers[0].memberName)
                team[0].createTeam(teamNumber: 0)
                team[1].createTeam(teamNumber: 1)
                fight()
                
            case "2" : // Display the game rules.
                gameRules()
                
            case "3" : // Change the default language.
                text.languageChoice()
                
            case "4" : // Exit the game.
                runGame = false
                
            default : // Display error message for bad entry.
                print(text.translation["selectionError"]!)
                gameStart()
            }
        }
    }
    
    /// Display game rules.
    
    func gameRules() {
        print(text.translation["gameRules"]!)
    }
    
    /// Start of the battle.
    
    func fight() {
        
        let startTimer = DispatchTime.now() // starting time of the game.
        
        while ((team[0].teamMembers[0].life > 0) || (team[0].teamMembers[1].life > 0) || (team[0].teamMembers[2].life > 0)) && ((team[1].teamMembers[0].life > 0) || (team[1].teamMembers[1].life > 0) || (team[1].teamMembers[2].life > 0)) {
            fighter.displayChooseFighter(teamNumber: 0)
            print(text.translation["chooseAttacker"]!)
            fighter.choose(teamNumber: 0, enableStatistics: true)
            if fighter.number[0].memberSpeciality == text.translation["Mage"]! {
                bonus.chest(fighterSelect: 0)
                print(text.translation["chooseSomeoneToHeal"]!)
                fighter.chooseFightersToHeal(teamNumber: 0)
                fighter.toHealNumber[0].life += fighter.number[0].healingAbility
                bonus.bacKToStandardWeapon(fighterSelect: 0)
            } else {
                bonus.chest(fighterSelect: 0)
                print(text.translation["chooseOpponent"]!)
                fighter.choose(teamNumber: 1, enableStatistics: false)
                fighter.number[1].life -= fighter.number[0].attack
                bonus.bacKToStandardWeapon(fighterSelect: 0)
            }
            
            if (team[1].teamMembers[0].life <= 0 && team[1].teamMembers[1].life <= 0 && team[1].teamMembers[2].life <= 0) {
                break
            }
            
            fighter.displayChooseFighter(teamNumber: 1)
            print(text.translation["chooseAttacker"]!)
            fighter.choose(teamNumber: 1, enableStatistics: true)
            if fighter.number[1].memberSpeciality == text.translation["Mage"]! {
                bonus.chest(fighterSelect: 1)
                print(text.translation["chooseSomeoneToHeal"]!)
                fighter.chooseFightersToHeal(teamNumber: 1)
                fighter.toHealNumber[1].life += fighter.number[1].healingAbility
                bonus.bacKToStandardWeapon(fighterSelect: 1)
            } else {
                bonus.chest(fighterSelect: 1)
                print(text.translation["chooseOpponent"]!)
                fighter.choose(teamNumber: 0, enableStatistics: false)
                fighter.number[0].life -= fighter.number[1].attack
                bonus.bacKToStandardWeapon(fighterSelect: 1)
            }
        }
        
        let endTimer = DispatchTime.now() // ending time of the game.
        gameTime = Int(round((Double(endTimer.uptimeNanoseconds - startTimer.uptimeNanoseconds) * 0.000000001 / 60)))
        
        
        
        print("""
            
            **********************************************************************
            *                                                                    *
            *                                                                    *
            *                      * * *  GAME OVER   * * *                      *
            *                                                                    *
            *                                                                    *
            **********************************************************************


            """)
        
        displayStatistics()
    }
    
    /// Display statistics menu.
    
    func displayStatistics() {
        print(text.translation["statitisticsMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // display statistics.
                playersStatistics[0].displayWinner()
                playersStatistics[0].displayResults(teamNumber: 0)
                playersStatistics[1].displayResults(teamNumber: 1)
                
            case "2" : // Return to start menu.
                gameStart()
                
            case "3" : // Exit the game.
                runGame = false
                
            default : // Display error message for bad entry.
                print(text.translation["selectionError"]!)
                displayStatistics()
            }
        }
    }
    
    /// Starting game loop.
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
}

