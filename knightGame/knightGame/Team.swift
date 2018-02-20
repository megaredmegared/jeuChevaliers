
/// Class for creation of all the members of a team.

class Team {
    
    /// Name of the team.
    
    var teamName = ""
 
    /// Array wich store the 3 members of a team.
    
    var teamMembers = [TeamMember(name: ""), TeamMember(name: ""), TeamMember(name: "")]
 
    /// Create a member.
    
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
            break
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

    /// Create and name teams.
    
    func createTeam(teamNumber: Int) {
        var textPrompt = ""
        switch teamNumber {
        case 0:
            textPrompt = "createFirstTeamName"
        case 1:
            textPrompt = "createSecondTeamName"
        default:
            break
        }
        
        print(text.translation[textPrompt]!)
        
        if let teamName = readLine() {
            self.teamName = teamName
            if text.usedNames.contains(teamName) || teamName == "" { // Check if the name is not already used or if there is no entry.
                print(text.translation["checkName"]!)
                createTeam(teamNumber: teamNumber)
            } else {
                text.usedNames.append(team[teamNumber].teamName)
                for member in 0...2 {
                    team[teamNumber].createMember(member: member)
                    team[teamNumber].teamMembers[member].chooseSpeciality(teamNumber: teamNumber)
                }
            }
        }
    }
    
    init(name: String) {
        teamName = name
    }
}

