import Foundation

/**
 Class Bonus wich let randomly apear a chest with a weapon inside.
 */

class Bonus {
    
    /**
     Simulation of a 10 faces dice.
     */
    
    var diceRoll = Int(arc4random_uniform(10))
    
    /**
     Special weapon that comes from the chest.
     */
    
    var specialWeapon = ""
    
    /**
     Random apear of the chest.
     */
    
    func chest(fighterSelect number: Int) {
        diceRoll = Int(arc4random_uniform(10))
        if diceRoll > 3 { // 3 = 40% of chance to for an empty chest (array count 0 to 9).
            let speciality = fighter.number[number].memberSpeciality
            if speciality == "Mage" {
                // Pick of a bonus healing weapon.
                
                let randomIndex = Int(arc4random_uniform(UInt32(weapon.healWith.count))) // index creation for random pick
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
                
                let randomIndex = Int(arc4random_uniform(UInt32(weapon.attackWith.count))) //  index creation for random pick
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
    
    /**
     Give back the default weapon after the fight.
     */
    
    func bacKToStandardWeapon(fighterSelect number: Int) {

        switch fighter.number[number].memberSpeciality {
            
        case text.translation["Dwarf"]!:
            fighter.number[number].attack = weapon.attackWith["axe"]!
            fighter.number[number].weaponName = text.translation["axe"]!
        case text.translation["Warrior"]!:
            fighter.number[number].attack = weapon.attackWith["sword"]!
            fighter.number[number].weaponName = text.translation["sword"]!
        case text.translation["Colossus"]!:
            fighter.number[number].attack = weapon.attackWith["cudgel"]!
            fighter.number[number].weaponName = text.translation["cudgel"]!
        case text.translation["Mage"]!:
            fighter.number[number].healingAbility = weapon.healWith["magic wand"]!
            fighter.number[number].weaponName = text.translation["magic wand"]!
        default:
            break
        }
    }
}

