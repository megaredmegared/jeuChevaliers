// class de création d'une équipe

class Team {
    var teamName = ""
    var teamLivesPoints = 10
    var teamMember1 = TeamMember(name: "") // comment éviter ce code redondant ???? <---------------------***
    var teamMember2 = TeamMember(name: "")
    var teamMember3 = TeamMember(name: "")
    
    
    func createMembers() {
        
        func createFirstMember() {
            print(text.translation["chooseFirstTeamMember"]!)
            if let teamMemberName = readLine() {
                if usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createFirstMember()
                } else {
                    teamMember1 = TeamMember(name: teamMemberName)
                    usedNames.append(teamMember1.memberName)
                }
            }
        }
        func createSecondMember() {
            print(text.translation["chooseSecondTeamMember"]!)
            if let teamMemberName = readLine() {
                if usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createSecondMember()
                } else {
                    teamMember2 = TeamMember(name: teamMemberName)
                    usedNames.append(teamMember2.memberName)
                }
            }
        }
        func createThirdMember() {
            print(text.translation["chooseThirdTeamMember"]!)
            if let teamMemberName = readLine() {
                if usedNames.contains(teamMemberName) || teamMemberName == "" {
                    
                    print(text.translation["checkName"]!)
                    
                    createThirdMember()
                } else {
                    teamMember3 = TeamMember(name: teamMemberName)
                    usedNames.append(teamMember3.memberName)
                }
            }
        }
        createFirstMember()
        createSecondMember()
        createThirdMember()
        
    }
    
    init(name: String) {
        teamName = name
    }
    
}

