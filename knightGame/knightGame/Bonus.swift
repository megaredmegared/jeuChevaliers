
import Foundation

/// Class Bonus wich let randomly apear a chest with a weapon inside.

class Bonus {
    
    /// Simulation of a 10 faces dice.
    
    var diceRoll = Int(arc4random_uniform(10))
    
    /// Special weapon that comes from the chest.
    
    var specialWeapon = ""
    
    /// Random apear of the chest.
    
    func chest(fighterSelect number: Int) {
        diceRoll = Int(arc4random_uniform(10))
        if diceRoll > 3 { // 3 = 40% of chance for an empty chest (array count 0 to 9).
            let speciality = fighter.number[number].memberSpeciality
            if speciality == "Mage" {
                
                // Pick of a bonus healing weapon.
                
                let randomIndex = Int(arc4random_uniform(UInt32(weapon.healBonus.count))) // index creation for random pick
                let randomWeapon = Array(weapon.healBonus.keys)[randomIndex]
                fighter.number[number].healingAbility = weapon.healBonus[randomWeapon]!
                fighter.number[number].weaponName = text.translation[randomWeapon]!
                
                print("""
                    
                    ****************************
                    *** \(text.translation["bonusReceived"]!) < \(fighter.number[number].weaponName): 💊 \(weapon.healBonus[randomWeapon]!) >  ***
                    ****************************
                    
                    """)
            } else {
                
                // Pick of a bonus weapon.
                
                let randomIndex = Int(arc4random_uniform(UInt32(weapon.attackBonus.count)))  //  index creation for random pick
                let randomWeapon = Array(weapon.attackBonus.keys)[randomIndex]
                fighter.number[number].attack = weapon.attackBonus[randomWeapon]!
                fighter.number[number].weaponName = text.translation[randomWeapon]!
                
                print("""
                    
                    ****************************
                    *** \(text.translation["bonusReceived"]!) < \(fighter.number[number].weaponName): 🗡 \(weapon.attackBonus[randomWeapon]!) >  ***
                    ****************************
                    
                    """)
            }
        } else {
            print(text.translation["noBonusWeapon"]!)
        }
    }
    
    /// Give back the default weapon after the fight.
    
    func bacKToStandardWeapon(fighterSelect number: Int) {
        var characterWeapon = ""
        if fighter.number[number].memberSpeciality == text.translation["Mage"]! {
            characterWeapon = "magic wand"
            fighter.number[number].healingAbility = weapon.healWith[characterWeapon]!
        } else {
            switch fighter.number[number].memberSpeciality {
            case text.translation["Dwarf"]!:
                characterWeapon = "axe"
            case text.translation["Warrior"]!:
                characterWeapon = "sword"
            case text.translation["Colossus"]!:
                characterWeapon = "cudgel"
            default:
                break
            }
            fighter.number[number].attack = weapon.attackWith[characterWeapon]!
        }
        fighter.number[number].weaponName = text.translation[characterWeapon]!
    }
}

