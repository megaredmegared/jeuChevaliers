// class de création d'une équipe

class Team {
    var teamName = ""
    var teamLivesPoints = 10
    var teamMember1 = ""
    var teamMember2 = ""
    var teamMember3 = ""
    var teamMembers = ["": ""]
    
    
    func createTeamMemberName(member: String) {
        var member = ""
        if var name = readLine() {
            member = name
        }
    }
    
    func createMembers() {
        print(text.translation["chooseMember"]!)
        if let speciality = readLine() {
            switch speciality {
            case "1":
                createTeamMemberName(member: self.teamMember1)
                print("Vous avez créé un nain qui s'appelle \(teamMember1)")
            case "2":
                print("pas de guerrier pour l'instant")
                createMembers()
            case "3":
                print("pas de colosse pour l'instant")
            default:
                print(text.translation["selectionError"]!)
                createMembers()
            }
        }
    }
    init(name: String) {
        teamName = name
    }
    
}

