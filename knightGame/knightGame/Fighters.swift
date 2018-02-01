class Fighters {

    var number = [TeamMember(name: ""), TeamMember(name: "")]
    var toHealNumber = [TeamMember(name: ""), TeamMember(name: "")]
    
    // Display if a player is dead
    
    func displayDeadMember(teamNumber: Int, member: Int) -> String {
        if team.number[teamNumber].teamMembers[member].life <= 0 {
            return "☠️"
        } else {
            return "\(team.number[teamNumber].teamMembers[member].memberName)"
        }
    }
    
    // *********************************
    // MARK: Selection of the fighters *
    // *********************************
    
    func displayChooseFighter(teamNumber: Int) {
        var opponentTeam: Int // can i just calculate it ?
        
        if teamNumber == 0 {
            opponentTeam = 1
        } else {
            opponentTeam = 0
        }
        print("""
            
            *************************   \(text.translation["The team"]!) \(team.number[teamNumber].teamName) \(text.translation["attack"]!) !!!   *************************
            """)
        
        print("""
            *
            *
            *     \(text.translation["opponentTeam"]!) \(team.number[opponentTeam].teamName) :
            *
            *     \(team.number[opponentTeam].teamMembers[0].memberName)
            *     \(team.number[opponentTeam].teamMembers[0].memberSpeciality)   /   \(text.translation["life"]!): \(team.number[opponentTeam].teamMembers[0].life) \(text.translation["attack"]!):  \(team.number[opponentTeam].teamMembers[0].attack)
            *
            *     \(team.number[opponentTeam].teamMembers[1].memberName)
            *     \(team.number[opponentTeam].teamMembers[1].memberSpeciality)   /   \(text.translation["life"]!): \(team.number[opponentTeam].teamMembers[1].life) \(text.translation["attack"]!):  \(team.number[opponentTeam].teamMembers[1].attack)
            *
            *     \(team.number[opponentTeam].teamMembers[2].memberName)
            *     \(team.number[opponentTeam].teamMembers[2].memberSpeciality)   /   \(text.translation["life"]!): \(team.number[opponentTeam].teamMembers[2].life) \(text.translation["attack"]!): \(team.number[opponentTeam].teamMembers[2].attack)
            *
            *
            ************************************************************************************************
            
            """)
        
    }
    func chooseFightersToHeal(teamNumber: Int) {
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[0].life) >   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[1].life) >   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[2].life) >
            
            """)
        
        if let chooseFighterMember = readLine() {
            switch chooseFighterMember {
            case "1":
                if team.number[teamNumber].teamMembers[0].life > 0 {
                    toHealNumber[teamNumber] = team.number[teamNumber].teamMembers[0]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFightersToHeal(teamNumber: teamNumber)
                }
            case "2":
                if team.number[teamNumber].teamMembers[1].life > 0 {
                    toHealNumber[teamNumber] = team.number[teamNumber].teamMembers[1]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFightersToHeal(teamNumber: teamNumber)
                }
            case "3":
                if team.number[teamNumber].teamMembers[2].life > 0 {
                    toHealNumber[teamNumber] = team.number[teamNumber].teamMembers[2]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    chooseFightersToHeal(teamNumber: teamNumber)
                }
            default:
                print(text.translation["selectionError"]!)
                chooseFightersToHeal(teamNumber: teamNumber)
            }
        }
    }
    
    func choose(teamNumber: Int) {
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[0].life) \(text.translation["attack"]!): \(team.number[teamNumber].teamMembers[0].attack) >   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[1].life) \(text.translation["attack"]!): \(team.number[teamNumber].teamMembers[1].attack) >   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   < \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[2].life) \(text.translation["attack"]!): \(team.number[teamNumber].teamMembers[2].attack) >
            
            """)
        
        if let chooseFighterMember = readLine() {
            switch chooseFighterMember {
            case "1":
                if team.number[teamNumber].teamMembers[0].life > 0 {
                    number[teamNumber] = team.number[teamNumber].teamMembers[0]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    choose(teamNumber: teamNumber)
                }
            case "2":
                if team.number[teamNumber].teamMembers[1].life > 0 {
                    number[teamNumber] = team.number[teamNumber].teamMembers[1]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    choose(teamNumber: teamNumber)
                }
            case "3":
                if team.number[teamNumber].teamMembers[2].life > 0 {
                    number[teamNumber] = team.number[teamNumber].teamMembers[2]
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    choose(teamNumber: teamNumber)
                }
            default:
                print(text.translation["selectionError"]!)
                choose(teamNumber: teamNumber)
            }
        }
    }
    
}
