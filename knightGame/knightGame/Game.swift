// *****************
// *   Game Logic  *
// *****************

class Game {
    var runGame = true // Game parameter to trigger the game
    var teamOne: Team = Team(name: "")
    var teamTwo: Team = Team(name: "")
    var fighterOne = TeamMember(name: "")
    var fighterTwo = TeamMember(name: "")
    
    // Display starting menu
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // Start to play
                createTeam()
                
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
    
    
    // Display game rules
    
    func gameRules() {
        print(text.translation["gameRules"]!)
    }
    
    // Creation of the teams
    
    func createTeam() {
        
        // creation of the first team
        
        print(text.translation["createFirstTeamName"]!)
        func createTeamOne() {
            if let teamName = readLine() {
                teamOne = Team(name: teamName)
                if teamName == "" { // Check if the name is not already used or if there is no entry
                    print(text.translation["checkName"]!)
                    createTeamOne()
                } else {
                    text.usedNames.append(teamOne.teamName)
                    teamOne.createMembers()
                }
            }
        }
        createTeamOne()
        
        // creation of the second team
        
        print(text.translation["createSecondTeamName"]!)
        func createTeamTwo() {
            if let teamName = readLine() {
                teamTwo = Team(name: teamName)
                if text.usedNames.contains(teamName) || teamName == "" { // Check if the name is not already used or if there is no entry
                    print(text.translation["checkName"]!)
                    createTeamTwo()
                } else {
                    text.usedNames.append(teamOne.teamName)
                    teamTwo.createMembers()
                }
            }
        }
        createTeamTwo()
        
        print("""
            
            \(text.translation["The team"]!) \(teamOne.teamName) :
            
            \(teamOne.teamMembers[0].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[0].attack)
            \(teamOne.teamMembers[1].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[1].attack)
            \(teamOne.teamMembers[2].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[2].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[2].attack)
            
            vs
            
            \(text.translation["The team"]!) \(teamTwo.teamName) :
            
            \(teamTwo.teamMembers[0].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[0].attack)
            \(teamTwo.teamMembers[1].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[1].attack)
            \(teamTwo.teamMembers[2].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[2].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[2].attack)
            
            \(text.translation["letTheBestWin"]!)
            
            """)
        startFight()
    }
    // Start of the battle
    
    func chooseTeamOneFighter() {
        print("""
            
            \(text.translation["chooseMember"]!):
            
            1. \(teamOne.teamMembers[0].memberName) 2. \(teamOne.teamMembers[1].memberName) 3. \(teamOne.teamMembers[2].memberName)
            
            """)
        
        if let chooseMemberToFight = readLine() {
            switch chooseMemberToFight {
            case "1":
                if teamOne.teamMembers[0].life > 0 {
                    fighterOne = teamOne.teamMembers[0]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamOneFighter()
                }
            case "2":
                if teamOne.teamMembers[1].life > 0 {
                    fighterOne = teamOne.teamMembers[1]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamOneFighter()
                }
            case "3":
                if teamOne.teamMembers[2].life > 0 {
                    fighterOne = teamOne.teamMembers[2]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamOneFighter()
                }
            default:
                print(text.translation["selectionError"]!)
                chooseTeamOneFighter()
            }
        }
    }
    func chooseTeamTwoFighter() {
        print("""
            
            \(text.translation["chooseMember"]!):
            
            1. \(teamTwo.teamMembers[0].memberName) 2. \(teamTwo.teamMembers[1].memberName) 3. \(teamTwo.teamMembers[2].memberName)
            
            """)
        
        if let chooseMemberToFight = readLine() {
            switch chooseMemberToFight {
            case "1":
                if teamTwo.teamMembers[0].life > 0 {
                    fighterTwo = teamTwo.teamMembers[0]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamTwoFighter()
                }
            case "2":
                if teamTwo.teamMembers[1].life > 0 {
                    fighterTwo = teamTwo.teamMembers[1]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamTwoFighter()
                }
            case "3":
                if teamTwo.teamMembers[2].life > 0 {
                    fighterTwo = teamTwo.teamMembers[2]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseTeamTwoFighter()
                }
            default:
                print(text.translation["selectionError"]!)
                chooseTeamTwoFighter()
            }
        }
    }
    
    
    func startFight() {
        while (teamOne.teamMembers[0].life + teamOne.teamMembers[1].life + teamOne.teamMembers[2].life > 0) && (teamTwo.teamMembers[0].life + teamTwo.teamMembers[1].life + teamTwo.teamMembers[2].life > 0) {
            
            print("""
                
                \(teamOne.teamName) :
                
                \(teamOne.teamMembers[0].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[0].attack)
                \(teamOne.teamMembers[1].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[1].attack)
                \(teamOne.teamMembers[2].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[2].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[2].attack)
                
                \(teamTwo.teamName) :
                
                \(teamTwo.teamMembers[0].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[0].attack)
                \(teamTwo.teamMembers[1].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[1].attack)
                \(teamTwo.teamMembers[2].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[2].life) \(text.translation["attack"]!) =
                \(teamTwo.teamMembers[2].attack)
                
                """)
            print("\(text.translation["The team"]!) \(teamOne.teamName) \(text.translation["attack"]!) !!!")
            chooseTeamOneFighter()
            chooseTeamTwoFighter()
            fighterTwo.life -= fighterOne.attack
            if (teamTwo.teamMembers[0].life + teamTwo.teamMembers[1].life + teamTwo.teamMembers[2].life <= 0) {
                break
            }
            print("""
                
                \(teamOne.teamName) :
                
                \(teamOne.teamMembers[0].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[0].attack)
                \(teamOne.teamMembers[1].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[1].attack)
                \(teamOne.teamMembers[2].memberName) \(text.translation["the"]!) \(teamOne.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamOne.teamMembers[2].life) \(text.translation["attack"]!) =  \(teamOne.teamMembers[2].attack)
                
                \(teamTwo.teamName) :
                
                \(teamTwo.teamMembers[0].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[0].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[0].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[0].attack)
                \(teamTwo.teamMembers[1].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[1].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[1].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[1].attack)
                \(teamTwo.teamMembers[2].memberName) \(text.translation["the"]!) \(teamTwo.teamMembers[2].memberSpeciality): \(text.translation["life"]!) = \(teamTwo.teamMembers[2].life) \(text.translation["attack"]!) =  \(teamTwo.teamMembers[2].attack)
                
                """)
            print("\(text.translation["The team"]!) \(teamTwo.teamName) \(text.translation["attack"]!) !!!")
            chooseTeamTwoFighter()
            chooseTeamOneFighter()
            fighterOne.life -= fighterTwo.attack
        }
        
        
        print("""
            
            *************************** * * *  GAME OVER   * * * ***************************

            """)
        if (teamOne.teamMembers[0].life + teamOne.teamMembers[1].life + teamOne.teamMembers[2].life > 0) {
            print("Game over")//  print(text.translation["gameOver"]!, \(teamOne.teamName))
        } else {
            print("l'équipe 2 a gagnée")
        }
    }
    
    // Starting game loop
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

