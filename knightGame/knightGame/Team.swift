// class creation of a team

class Team {
    var teamName = ""
    
    var teamMembers = [TeamMember(name: ""), TeamMember(name: ""), TeamMember(name: "")]
    
    func createMember(member: Int) {
        
        var textPrompt = ""
        switch member {
        case 0:
            textPrompt = "chooseFirstTeamMember"
        case 1:
            textPrompt = "chooseSecondTeamMember"
        case 2:
            textPrompt = "chooseThirdTeamMember"
        default:
            textPrompt = "chooseThirdTeamMember" // check to write something usefull here
        }
        
        print(text.translation[textPrompt]!)
        
        if let teamMemberName = readLine() {
            if text.usedNames.contains(teamMemberName) || teamMemberName == "" {
                
                print(text.translation["checkName"]!)
                
                createMember(member: member)
            } else {
                teamMembers[member] = TeamMember(name: teamMemberName)
                text.usedNames.append(teamMembers[member].memberName)
            }
        }
    }
    
    func createMembers() {
        createMember(member: 0)
        teamMembers[0].chooseSpeciality()
        createMember(member: 1)
        teamMembers[1].chooseSpeciality()
        createMember(member: 2)
        teamMembers[2].chooseSpeciality()
    }
 
    init(name: String) {
        teamName = name
    }
    
}

