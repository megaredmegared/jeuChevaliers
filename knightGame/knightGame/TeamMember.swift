class TeamMember {
    
    var memberName = ""
    var life = 0
    var attack = 0
    var healingAbility = 0
    var memberSpeciality = ""
    let weapon = Weapons()
    
    func chooseSpeciality() {
        print(text.translation["chooseMember"]!)
        if let speciality = readLine() {
            switch speciality {
            case "1":
                memberSpeciality = text.translation["Dwarf"]!
                attack += weapon.attackWith["axe"]!
                life += 80
            case "2":
                memberSpeciality = text.translation["Warrior"]!
                attack += weapon.attackWith["sword"]!
                life += 100
            case "3":
                memberSpeciality = text.translation["Colossus"]!
                attack += weapon.attackWith["cudgel"]!
                life += 120
            case "4":
                memberSpeciality = text.translation["Mage"]!
                healingAbility += weapon.healWith["magic wand"]!
                life += 150
                
            default:
                print(text.translation["selectionError"]!)
                chooseSpeciality()
            }
        }
    }
    
    init(name: String) {
        memberName = name
    }
}
