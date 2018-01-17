class TeamMember {
    
    var memberName = ""
    
    /*var memberSpeciality = GameCharacters()  // <--------- quel type pour ça ??????????
    
    func chooseSpeciality() {
        print(text.translation["chooseMember"]!)
        if let speciality = readLine() {
            switch speciality {
            case "1":
                memberSpeciality = Dwarf()
            case "2":
                memberSpeciality = Warrior()
            case "3":
                memberSpeciality = Colossus()
            case "4":
                memberSpeciality = Mage()
                
            default:
                print(text.translation["selectionError"]!)
                createMembers()
            }
        }
    }*/
    
    init(name: String) {
        memberName = name
    }
}
