// class de création d'une équipe

class TeamOne {
    var teamName = ""
    var teamLivesPoints = 10
    //var member1: TeamMember
    //var member2: TeamMember
    //var member3: TeamMember
    
    func createMembers(memberName: String) {
        print("""

        Choisissez la spécialité de votre personnage:

        1. Nain    2. Guerrier    3. Colosse    4. Mage

        """)
        
        if let speciality = readLine() {
            switch speciality {
            case "1":
                print("pas de nain pour l'instant")//member1 = .Dwarf
            case "2":
                print("pas de guerrier pour l'instant")
            case "3":
                print("pas de colosse pour l'instant")
            default:
                print("Yo mauvaise entrée") //EntrieError.printError()
            }
        }
    }
    init(name: String) {
        teamName = name
    }
    
}

