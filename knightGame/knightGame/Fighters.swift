class Fighters {
    
    var number = [TeamMember(name: ""), TeamMember(name: "")]
    var toHealNumber = [TeamMember(name: ""), TeamMember(name: "")]
    
    // Display if a player is dead
    
    func displayDeadMember(teamNumber: Int, member: Int) -> String {
        if team.number[teamNumber].teamMembers[member].life <= 0 {
            return "☠️"
        } else {
            return "\(team.number[teamNumber].teamMembers[member].memberName) "
        }
    }
    
    // *********************************
    // MARK: Selection of the fighters *
    // *********************************
    
    func displayChooseFighter(teamNumber: Int) {
        /*var opponentTeam: Int // can i just calculate it ?
         
         if teamNumber == 0 {
         opponentTeam = 1
         } else {
         opponentTeam = 0
         }*/
        
        let opponentTeam = abs(teamNumber - 1) // caculate opponent team
        
        func infoOpponent(_ member: Int) -> String {
            if team.number[opponentTeam].teamMembers[member].life <= 0 {
                return ""
            } else {
                return "\(team.number[opponentTeam].teamMembers[member].memberSpeciality)   /   \(text.translation["life"]!): \(team.number[opponentTeam].teamMembers[member].life) \(team.number[opponentTeam].teamMembers[member].weaponName):  \(team.number[opponentTeam].teamMembers[member].attack)"
            }
        }
        
        print("""
            
            
            
            
            *************************   \(text.translation["The team"]!) \(team.number[teamNumber].teamName) \(text.translation["attack"]!) !!!   *************************
            """)
        
        print("""
            *
            *
            *     \(text.translation["opponentTeam"]!) \(team.number[opponentTeam].teamName) :
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 0))
            *     \(infoOpponent(0))
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 1))
            *     \(infoOpponent(1))
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 2))
            *     \(infoOpponent(2))
            *
            *
            ************************************************************************************************
            
            """)
    }
    
    func chooseFightersToHeal(teamNumber: Int) {
        
        func infoFightersToHeal(_ member: Int) -> String {
            if team.number[teamNumber].teamMembers[member].life <= 0 {
                return ""
            } else {
                return "< \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[member].life) >"
            }
        }
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoFightersToHeal(0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoFightersToHeal(1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoFightersToHeal(2))
            
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
        
        func infoAttacker(_ member: Int) -> String {
            if team.number[teamNumber].teamMembers[member].life <= 0 {
                return ""
            } else {
                return "< \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[member].life) \(team.number[teamNumber].teamMembers[member].weaponName): \(team.number[teamNumber].teamMembers[member].attack) >"
            }
        }
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoAttacker(0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoAttacker(1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoAttacker(2))
            
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
