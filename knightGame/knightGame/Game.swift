// *****************
// *   Game Logic  *
// *****************

class Game {
    var runGame = true // Game parameter to trigger the game
    var teamOne: Team = Team(name: "")
    var teamTwo: Team = Team(name: "")
    
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
            
            L'équipe \(teamOne.teamName) :
            
            \(teamOne.teamMembers[0].memberName) le \(teamOne.teamMembers[0].memberSpeciality): vie = \(teamOne.teamMembers[0].life) attaque =  \(teamOne.teamMembers[0].attack)
            \(teamOne.teamMembers[1].memberName) le \(teamOne.teamMembers[1].memberSpeciality): vie = \(teamOne.teamMembers[1].life) attaque =  \(teamOne.teamMembers[1].attack)
            \(teamOne.teamMembers[2].memberName) le \(teamOne.teamMembers[2].memberSpeciality): vie = \(teamOne.teamMembers[2].life) attaque =  \(teamOne.teamMembers[2].attack)

            va affronter
            
            L'équipe \(teamTwo.teamName) :
            
            \(teamTwo.teamMembers[0].memberName) le \(teamTwo.teamMembers[0].memberSpeciality): vie = \(teamTwo.teamMembers[0].life) attaque =  \(teamTwo.teamMembers[0].attack)
            \(teamTwo.teamMembers[1].memberName) le \(teamTwo.teamMembers[1].memberSpeciality): vie = \(teamTwo.teamMembers[1].life) attaque =  \(teamTwo.teamMembers[1].attack)
            \(teamTwo.teamMembers[2].memberName) le \(teamTwo.teamMembers[2].memberSpeciality): vie = \(teamTwo.teamMembers[2].life) attaque =  \(teamTwo.teamMembers[2].attack)

            Que le meilleur gagne !!!
            
            """)
        
        // Start of th battle
        
        func startFight() {
            while (teamOne.teamMembers[0].life + teamOne.teamMembers[1].life + teamOne.teamMembers[2].life > 0) && (teamTwo.teamMembers[0].life + teamTwo.teamMembers[1].life + teamTwo.teamMembers[2].life > 0) {
                
            }
            print("""
            
            *************************** * * *  GAME OVER   * * * ***************************

            """)
            if (teamOne.teamMembers[0].life + teamOne.teamMembers[1].life + teamOne.teamMembers[2].life > 0) {
                print("l'équipe 1 a gagnée")
            } else {
                print("l'équipe 2 a gagnée")
            }
        }
    }
    
    // Starting loop of the game
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

