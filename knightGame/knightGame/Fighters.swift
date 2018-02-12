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
    // Function to display heal power instead of attack if is a Mage
    
    func displayAttackOrhealingAbility(teamNumber: Int, member: Int) -> String {
        if team.number[teamNumber].teamMembers[member].memberSpeciality == text.translation["Mage"]! {
            return "💊 \(team.number[teamNumber].teamMembers[member].healingAbility)"
        } else {
            return "🗡 \(team.number[teamNumber].teamMembers[member].attack)"
        }
    }
    
    
    // *********************************
    // MARK: Selection of the fighters *
    // *********************************

    func infoOpponent(opponentTeam: Int, member: Int) -> String {
        if team.number[opponentTeam].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "\(team.number[opponentTeam].teamMembers[member].memberSpeciality)   /   \(text.translation["life"]!): \(team.number[opponentTeam].teamMembers[member].life)   /   \(team.number[opponentTeam].teamMembers[member].weaponName):  \(displayAttackOrhealingAbility(teamNumber: opponentTeam, member: member))"
        }
    }
    
    func displayChooseFighter(teamNumber: Int) {
        
        let opponentTeam = abs(teamNumber - 1) // caculate opponent team using absolute value for one line code var or let ?
      
        print("""
            
            
            
            
            *************************   \(text.translation["The team"]!) \(team.number[teamNumber].teamName) \(text.translation["attack"]!) !!!   *************************
            """)
        
        print("""
            *
            *
            *     \(text.translation["opponentTeam"]!) \(team.number[opponentTeam].teamName) :
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 0))
            *     \(infoOpponent(opponentTeam: opponentTeam, member: 0))
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 1))
            *     \(infoOpponent(opponentTeam: opponentTeam, member: 1))
            *
            *     \(displayDeadMember(teamNumber: opponentTeam, member: 2))
            *     \(infoOpponent(opponentTeam: opponentTeam, member: 2))
            *
            *
            ************************************************************************************************
            
            """)
    }
  
    func infoFightersToHeal(teamNumber: Int, member: Int) -> String {
        if team.number[teamNumber].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "< \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[member].life) >"
        }
    }

    func chooseFightersToHeal(teamNumber: Int) {
        

        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoFightersToHeal(teamNumber: teamNumber, member: 0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoFightersToHeal(teamNumber: teamNumber, member: 1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoFightersToHeal(teamNumber: teamNumber, member: 2))
            
            """)
        
        if let chooseFighterMember = readLine() {
            let member = Int(chooseFighterMember)! - 1
            switch chooseFighterMember {
            case "1", "2", "3":
                if team.number[teamNumber].teamMembers[member].life > 0 {
                    toHealNumber[teamNumber] = team.number[teamNumber].teamMembers[member]
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

    func infoAttacker(teamNumber: Int, member: Int) -> String {
        if team.number[teamNumber].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "< \(text.translation["life"]!): \(team.number[teamNumber].teamMembers[member].life) \(team.number[teamNumber].teamMembers[member].weaponName): \(displayAttackOrhealingAbility(teamNumber: teamNumber, member: member)) >"
        }
    }
    
    func choose(teamNumber: Int) {
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoAttacker(teamNumber: teamNumber, member: 0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoAttacker(teamNumber: teamNumber, member: 1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoAttacker(teamNumber: teamNumber, member: 2))
            
            """)
        
        if let chooseFighterMember = readLine() {
            let member = Int(chooseFighterMember)! - 1
            switch chooseFighterMember {
            case "1", "2", "3":
                if team.number[teamNumber].teamMembers[member].life > 0 {
                    number[teamNumber] = team.number[teamNumber].teamMembers[member]
                    statistics.countMoves(teamNumber: teamNumber, member: member)
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
