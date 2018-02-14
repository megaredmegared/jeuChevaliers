
/// Create a selection of fighter for each fight.

class Fighters {
    
    /// Array to stock the fighters involve in a fight, attacker is first in the array and attacked is second in the array.
    
    var number = [TeamMember(name: ""), TeamMember(name: "")]
    
    /// Array to stock the fighters involve in a healing, healer is first in the array and healded is second in the array.
    
    var toHealNumber = [TeamMember(name: ""), TeamMember(name: "")]
    
    /// Display ☠️ if a player is dead.
    
    func displayDeadMember(teamNumber: Int, member: Int) -> String {
        if team[teamNumber].teamMembers[member].life <= 0 {
            return "☠️"
        } else {
            return "\(team[teamNumber].teamMembers[member].memberName) "
        }
    }
    
    /// Display heal points instead of attack points if it's a Mage.
    
    func displayAttackOrhealingAbility(teamNumber: Int, member: Int) -> String {
        if team[teamNumber].teamMembers[member].memberSpeciality == text.translation["Mage"]! {
            return "💊 \(team[teamNumber].teamMembers[member].healingAbility)"
        } else {
            return "🗡 \(team[teamNumber].teamMembers[member].attack)"
        }
    }
    
    /// Display infos for opponent fighters if they are still alive.
    
    func infoOpponent(opponentTeam: Int, member: Int) -> String {
        if team[opponentTeam].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "\(team[opponentTeam].teamMembers[member].memberSpeciality)   /   \(text.translation["life"]!): ❤️ \(team[opponentTeam].teamMembers[member].life)   /   \(team[opponentTeam].teamMembers[member].weaponName):  \(displayAttackOrhealingAbility(teamNumber: opponentTeam, member: member))"
        }
    }
    
    /// Display menu for choosing the fighter who attack's (or heal).
    
    func displayChooseFighter(teamNumber: Int) {
        
        let opponentTeam = abs(teamNumber - 1) // caculate opponent team using absolute value
        
        print("""
            
            
            
            
            *************************   \(text.translation["The team"]!) \(team[teamNumber].teamName) \(text.translation["attack"]!) !!!   *************************
            """)
        
        print("""
            *
            *
            *     \(text.translation["opponentTeam"]!) \(team[opponentTeam].teamName) :
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
    
    /// Display infos of the team member to heal if is still alive.
    
    func infoFightersToHeal(teamNumber: Int, member: Int) -> String {
        if team[teamNumber].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "< \(text.translation["life"]!): ❤️ \(team[teamNumber].teamMembers[member].life) >"
        }
    }
    
    /// Display menu to choose wich member to heal.
    
    func chooseFightersToHeal(teamNumber: Int) {
        
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoFightersToHeal(teamNumber: teamNumber, member: 0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoFightersToHeal(teamNumber: teamNumber, member: 1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoFightersToHeal(teamNumber: teamNumber, member: 2))
            
            """)
        
        if let chooseFighterMember = readLine() {
            
            switch chooseFighterMember {
            case "1", "2", "3":
                let member = Int(chooseFighterMember)! - 1 // Fix difference of number typed and array starting at 0.
                if team[teamNumber].teamMembers[member].life > 0 {
                    toHealNumber[teamNumber] = team[teamNumber].teamMembers[member]
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
    
    /// Display infos of members only if still alive.
    
    func infoAttacker(teamNumber: Int, member: Int) -> String {
        if team[teamNumber].teamMembers[member].life <= 0 {
            return ""
        } else {
            return "< \(text.translation["life"]!): ❤️ \(team[teamNumber].teamMembers[member].life) / \(team[teamNumber].teamMembers[member].weaponName): \(displayAttackOrhealingAbility(teamNumber: teamNumber, member: member)) >"
        }
    }
    
    /// Display menu to choose with wich member to attack or heal.
    
    func choose(teamNumber: Int, enableStatistics: Bool) {
        
        print("""
            
            1. \(displayDeadMember(teamNumber: teamNumber, member: 0))   \(infoAttacker(teamNumber: teamNumber, member: 0))   /   2. \(displayDeadMember(teamNumber: teamNumber, member: 1))   \(infoAttacker(teamNumber: teamNumber, member: 1))   /   3. \(displayDeadMember(teamNumber: teamNumber, member: 2))   \(infoAttacker(teamNumber: teamNumber, member: 2))
            
            """)
        
        if let chooseFighterMember = readLine() {
            switch chooseFighterMember {
            case "1", "2", "3":
                let member = Int(chooseFighterMember)! - 1 // Fix difference of number typed and array starting at 0.
                if team[teamNumber].teamMembers[member].life > 0 {
                    number[teamNumber] = team[teamNumber].teamMembers[member]
                    if enableStatistics == true {
                        playersStatistics[teamNumber].countMoves(teamNumber: teamNumber, member: member)
                    }
                } else {
                    print("\(text.translation["selectDeadMember"]!)")
                    choose(teamNumber: teamNumber, enableStatistics: enableStatistics)
                }
            default:
                print(text.translation["selectionError"]!)
                choose(teamNumber: teamNumber, enableStatistics: enableStatistics)
            }
        }
    }
}
