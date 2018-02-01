class Teams {
    
    var number = [Team(name: ""), Team(name: "")]
    
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
            number[chooseTeam] = Team(name: teamName)
            if teamName == "" { // Check if the name is not already used or if there is no entry
                print(text.translation["checkName"]!)
                createTeam(chooseTeam: chooseTeam)
            } else {
                text.usedNames.append(number[chooseTeam].teamName)
                number[chooseTeam].createMembers()
            }
        }
    }
    
    func create() {
        createTeam(chooseTeam: 0)
        createTeam(chooseTeam: 1)
    }
}
