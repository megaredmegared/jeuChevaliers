import Foundation
class BonusWeapon {
    
    var diceRoll = Int(arc4random_uniform(11))
    var specialWeapon = ""
    
    func chest(fighterSelect number: Int) {
        diceRoll = Int(arc4random_uniform(11))
        if diceRoll > 4 {
            let speciality = fighter.number[number].memberSpeciality
            if speciality == "Mage" {
                // pick of a bonus healing weapon
                
                //let random = weapon.attackWith[Int(arc4random_uniform(UInt32(weapon.attackWith.count)))] -> random pick of an array, find out for a dictionary
                
                print("""

                ********************************* Vous auriez du recevoir un bonus de soin  *********************************

                """)
                
            } else {
                // pick of a bonus weapon
                print("""

                 ********************************* Vous auriez du recevoir une arme bonus  *********************************

                """)
            }
        } else {
            print(text.translation["noBonusWeapon"]!)
        }
    }
}

