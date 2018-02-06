// *****************
// *   Game Logic  *
// *****************

class Game {
    var runGame = true // Game parameter to trigger the game
    var bonus = Bonus()
    
    // *****************************
    // MARK: Display starting menu *
    // *****************************
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // Start to play
                team.create()
                fight()
                
            case "2" : // Display the game rules
                gameRules()
                
            case "3" : // Change the default language
                text.languageChoice()
                
            case "4" : // Exit the game
                runGame = false
                
            default : // Display error message for bad entry
                print(text.translation["selectionError"]!)
                gameStart()
            }
        }
    }
    
    
    // **************************
    // MARK: Display game rules *
    // **************************
    
    func gameRules() {
        print(text.translation["gameRules"]!)
    }
    
    
    // ***************************
    // MARK: Start of the battle *
    // ***************************
    
    func fight() {
        while ((team.number[0].teamMembers[0].life > 0) || (team.number[0].teamMembers[1].life > 0) || (team.number[0].teamMembers[2].life > 0)) && ((team.number[1].teamMembers[0].life > 0) || (team.number[1].teamMembers[1].life > 0) || (team.number[1].teamMembers[2].life > 0)) {
            
            fighter.displayChooseFighter(teamNumber: 0)
            print(text.translation["chooseAttacker"]!)
            fighter.choose(teamNumber: 0)
            if fighter.number[0].memberSpeciality == "Mage" {
                bonus.chest(fighterSelect: 0)
                print(text.translation["chooseSomeoneToHeal"]!)
                fighter.chooseFightersToHeal(teamNumber: 0)
                fighter.toHealNumber[0].life += fighter.number[0].healingAbility
                bonus.bacKToStandardWeapon(fighterSelect: 0)
            } else {
                bonus.chest(fighterSelect: 0)
                print(text.translation["chooseOpponent"]!)
                fighter.choose(teamNumber: 1)
                fighter.number[1].life -= fighter.number[0].attack
                bonus.bacKToStandardWeapon(fighterSelect: 0)
            }
            
            if (team.number[1].teamMembers[0].life <= 0 && team.number[1].teamMembers[1].life <= 0 && team.number[1].teamMembers[2].life <= 0) {
                break
            }
            
            fighter.displayChooseFighter(teamNumber: 1)
            print(text.translation["chooseAttacker"]!)
            fighter.choose(teamNumber: 1)
            if fighter.number[1].memberSpeciality == "Mage" {
                bonus.chest(fighterSelect: 1)
                print(text.translation["chooseSomeoneToHeal"]!)
                fighter.chooseFightersToHeal(teamNumber: 1)
                fighter.toHealNumber[1].life += fighter.number[1].healingAbility
                bonus.bacKToStandardWeapon(fighterSelect: 1)
            } else {
                bonus.chest(fighterSelect: 1)
                print(text.translation["chooseOpponent"]!)
                fighter.choose(teamNumber: 0)
                fighter.number[0].life -= fighter.number[1].attack
                bonus.bacKToStandardWeapon(fighterSelect: 1)
            }
        }
        
        
        print("""
            
            **********************************************************************
            *                                                                    *
            *                                                                    *
            *                      * * *  GAME OVER   * * *                      *
            *                                                                    *
            *                                                                    *
            **********************************************************************


            """)
        if (team.number[0].teamMembers[0].life + team.number[0].teamMembers[1].life + team.number[0].teamMembers[2].life > 0) {
            print("Game over")//  print(text.translation["gameOver"]!, \(teams[0].teamName))
        } else {
            print("l'équipe 2 a gagnée")
        }
    }
    
    
    // **************************
    // MARK: Starting game loop *
    // **************************
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

