// class de création d'une équipe

class Team {
    var teamName = ""
    
    var teamMembers = [TeamMember(name: ""), TeamMember(name: ""), TeamMember(name: "")]
    
    /*func createMembers(_: Int) {
        for i in 0...2 {
            var textPrompt = ""
            switch i {
            case 0:
                textPrompt = "chooseFirstTeamMember"
            case 1:
                textPrompt = "chooseSecondTeamMember"
            case 2:
                textPrompt = "chooseThirdTeamMember"
            default:
                textPrompt = "chooseThirdTeamMember" // à corriger aussi
            }
            
            print(text.translation[textPrompt]!)
            
            if let teamMemberName = readLine() {
                if text.usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createMembers(i)
                } else {
                    teamMembers[i] = TeamMember(name: teamMemberName)
                    text.usedNames.append(teamMembers[i].memberName)
                }
                
            }
        }*/
        
        
        func createFirstMember() {
            print(text.translation["chooseFirstTeamMember"]!)
            if let teamMemberName = readLine() {
                if text.usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createFirstMember()
                } else {
                    teamMembers[0] = TeamMember(name: teamMemberName)
                    text.usedNames.append(teamMembers[0].memberName)
                }
            }
            teamMembers[0].chooseSpeciality()
        }
        
        func createSecondMember() {
            print(text.translation["chooseSecondTeamMember"]!)
            if let teamMemberName = readLine() {
                if text.usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createSecondMember()
                } else {
                    teamMembers[1] = TeamMember(name: teamMemberName)
                    text.usedNames.append(teamMembers[1].memberName)
                }
            }
            teamMembers[1].chooseSpeciality()
        }
        
        func createThirdMember() {
            print(text.translation["chooseThirdTeamMember"]!)
            if let teamMemberName = readLine() {
                if text.usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createThirdMember()
                } else {
                    teamMembers[2] = TeamMember(name: teamMemberName)
                    text.usedNames.append(teamMembers[2].memberName)
                }
            }
            teamMembers[2].chooseSpeciality()
        }
        
        func createMembers() {
            createFirstMember()
            createSecondMember()
            createThirdMember()
        }
        
        
        
        
        init(name: String) {
            teamName = name
        }
        
}

