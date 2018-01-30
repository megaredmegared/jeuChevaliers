// *****************
// *   Game Logic  *
// *****************

class Game {
    var runGame = true // Game parameter to trigger the game
    var teams = [Team(name: ""), Team(name: "")]
    var fighters = [TeamMember(name: ""), TeamMember(name: "")]
    
    
    // *****************************
    // MARK: Display starting menu *
    // *****************************
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // Start to play
                createTeams()
                
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
    
    
    // *****************************
    // MARK: Creation of the teams *
    // *****************************
    
    func createTeam(chooseTeam: Int) {
        var textPrompt = ""
        switch chooseTeam {
        case 0:
            textPrompt = "createFirstTeamName"
        case 1:
            textPrompt = "createSecondTeamName"
        default:
            break
        }
        
        print(text.translation[textPrompt]!)
        
        if let teamName = readLine() {
            teams[chooseTeam] = Team(name: teamName)
            if teamName == "" { // Check if the name is not already used or if there is no entry
                print(text.translation["checkName"]!)
                createTeam(chooseTeam: chooseTeam)
            } else {
                text.usedNames.append(teams[chooseTeam].teamName)
                teams[chooseTeam].createMembers()
            }
        }
    }
    
    func createTeams() {
        createTeam(chooseTeam: 0)
        createTeam(chooseTeam: 1)
        fight()
    }
    
    
    // ***************************
    // MARK: Start of the battle *
    // ***************************
    
    // Display if a player is dead
    
    func displayDeadMember(team: Int, member: Int) -> String {
        if teams[team].teamMembers[member].life <= 0 {
            return "☠️"
        } else {
            return "\(teams[team].teamMembers[member].memberName)"
        }
    }
    
    func displayChooseFighter(team: Int) {
        var opponentTeam: Int // can i just calculate it ?
        
        if team == 0 {
            opponentTeam = 1
        } else {
            opponentTeam = 0
        }
        print("""
            
            ***************************************   \(text.translation["The team"]!) \(teams[team].teamName) \(text.translation["attack"]!) !!!   ***************************************
            
            """)
        
        print("""
            
            * \(text.translation["opponentTeam"]!) \(teams[opponentTeam].teamName) :
            *
            * \(teams[opponentTeam].teamMembers[0].memberName)
            * \(teams[opponentTeam].teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teams[1].teamMembers[0].life) \(text.translation["attack"]!) =  \(teams[opponentTeam].teamMembers[0].attack)
            *
            * \(teams[opponentTeam].teamMembers[1].memberName)
            * \(teams[opponentTeam].teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teams[opponentTeam].teamMembers[1].life) \(text.translation["attack"]!) =  \(teams[opponentTeam].teamMembers[1].attack)
            *
            * \(teams[opponentTeam].teamMembers[2].memberName)
            * \(teams[opponentTeam].teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teams[opponentTeam].teamMembers[2].life) \(text.translation["attack"]!) = \(teams[opponentTeam].teamMembers[2].attack)
            *
            *
            ************************************************************************************************
            
            """)
        
    }
    
    func chooseFighter(team: Int) {
        
        print("""
            
            1. \(displayDeadMember(team: team, member: 0)) 2. \(displayDeadMember(team: team, member: 1)) 3. \(displayDeadMember(team: team, member: 2))
            
            """)
        
        if let chooseFighterMember = readLine() {
            switch chooseFighterMember {
            case "1":
                if teams[team].teamMembers[0].life > 0 {
                    fighters[team] = teams[team].teamMembers[0]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFighter(team: team)
                }
            case "2":
                if teams[team].teamMembers[1].life > 0 {
                    fighters[team] = teams[team].teamMembers[1]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFighter(team: team)
                }
            case "3":
                if teams[team].teamMembers[2].life > 0 {
                    fighters[team] = teams[team].teamMembers[2]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFighter(team: team)
                }
            default:
                print(text.translation["selectionError"]!)
                chooseFighter(team: team)
            }
        }
    }

    func fight() {
        while ((teams[0].teamMembers[0].life > 0) || (teams[0].teamMembers[1].life > 0) || (teams[0].teamMembers[2].life > 0)) && ((teams[1].teamMembers[0].life > 0) || (teams[1].teamMembers[1].life > 0) || (teams[1].teamMembers[2].life > 0)) {
            
            displayChooseFighter(team: 0)
            print(text.translation["chooseAttacker"]!)
            chooseFighter(team: 0)
            print(text.translation["chooseOpponent"]!)
            chooseFighter(team: 1)
            fighters[1].life -= fighters[0].attack
            
            if (teams[1].teamMembers[0].life <= 0 && teams[1].teamMembers[1].life <= 0 && teams[1].teamMembers[2].life <= 0) {
                break
            }

            displayChooseFighter(team: 1)
            print(text.translation["chooseAttacker"]!)
            chooseFighter(team: 1)
            print(text.translation["chooseOpponent"]!)
            chooseFighter(team: 0)
            fighters[0].life -= fighters[1].attack
        }
        
        
        print("""
            
            *************************** * * *  GAME OVER   * * * ***************************

            """)
        if (teams[0].teamMembers[0].life + teams[0].teamMembers[1].life + teams[0].teamMembers[2].life > 0) {
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

