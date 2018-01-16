// **********************
// *   Logique du jeu   *
// **********************

class Game {
    var runGame = true // Paramètre du jeu actif ou non
    
    
    // Affichage au démarrage du jeu
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            switch choice {
                
            case "1" : // On commence à jouer
                createTeam()
                
            case "2" : // On affiche la règle du jeu
                gameRules()
                
            case "3" : // On quitte le jeu
                runGame = false
                
            default : // On affiche un message d'erreur pour tout saisie invalide
                print(text.translation["selectionError"]!)
                gameStart()
            }
        }
    }
    
    
    // Affichage de la régle du jeu
    
    func gameRules() {
        print(text.translation["gameRules"]!)
    }
    
    // Création des équipes
    
    func createTeam() {
        print(text.translation["createTeamName"]!)
        
        if let teamName = readLine() {
            let teamOne = TeamOne(name: teamName) // création de la première équipe
            print("""
                
                La première équipe s'appelle \(teamOne.teamName)
                
                """)
            print(text.translation["chooseFirstTeamMember"]!)
            teamOne.createMembers()
            print("le premier membre de l'équipe s'appelle \(teamOne.member1)")
        }
    }
    
    // Boucle de lancement du jeu
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

