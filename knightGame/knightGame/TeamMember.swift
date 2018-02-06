class TeamMember {
    
    var memberName = ""
    var life = 0
    var attack = 0
    var weaponName = ""
    var healingAbility = 0
    var memberSpeciality = ""
    
    func chooseSpeciality(teamNumber: Int) {
        print(text.translation["chooseMemberSpeciality"]!)
        if let speciality = readLine() {
            switch speciality {
            case "1":
                memberSpeciality = text.translation["Dwarf"]!
                attack = weapon.attackWith["axe"]!
                weaponName = text.translation["axe"]!
                life = 80
            case "2":
                memberSpeciality = text.translation["Warrior"]!
                attack = weapon.attackWith["sword"]!
                weaponName = text.translation["sword"]!
                life = 100
            case "3":
                memberSpeciality = text.translation["Colossus"]!
                attack = weapon.attackWith["cudgel"]!
                weaponName = text.translation["cudgel"]!
                life = 120
            case "4":
                // Code refactoring ???
                if team.number[teamNumber].teamMembers[0].memberSpeciality == text.translation["Mage"]! || team.number[teamNumber].teamMembers[1].memberSpeciality == text.translation["Mage"]!  {
                    print(text.translation["maxMage"]!)
                    chooseSpeciality(teamNumber: teamNumber)
                } else {
                    memberSpeciality = text.translation["Mage"]!
                    healingAbility = weapon.healWith["magic wand"]!
                    weaponName = text.translation["magic wand"]!
                    life = 150
                }
                
            default:
                print(text.translation["selectionError"]!)
                chooseSpeciality(teamNumber: teamNumber)
            }
        }
    }
    
    init(name: String) {
        memberName = name
    }
}
