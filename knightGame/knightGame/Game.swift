// **********************
// *   Logique du jeu   *
// **********************

class Game {
    var runGame = true // Paramètre du jeu actif ou non
    var teamOne: Team
    var teamTwo: Team
    
    // Affichage du menu de démarrage du jeu
    
    func gameStart() {
        print(text.translation["startMenu"]!)
        if let choice = readLine() {
            
            switch choice {
                
            case "1" : // On commence à jouer
                createTeam()
                
            case "2" : // On affiche la règle du jeu
                gameRules()
                
            case "3" : // On change la langue du jeu
                text.languageChoice()
                
            case "4" : // On quitte le jeu
                runGame = false
                
            default : // On affiche un message d'erreur pour toute saisie invalide
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
        // création de la première équipe
        print(text.translation["createFirstTeamName"]!)
       
        if let teamName = readLine() {
            
            teamOne = Team(name: teamName)
           
            print("""
                
                La première équipe s'appelle \(teamOne.teamName)
                
                """)
            
            //teamOne.createMembers()
            //print("le premier membre de l'équipe s'appelle \(teamOne.member1)")
        }
        
        // création de la deuxième équipe
        print(text.translation["createSecondTeamName"]!)
        
        if let teamName = readLine() {
            teamTwo = Team(name: teamName)
            if teamTwo.teamName == teamOne.teamName {
                // redo team ask
            } else {
            print("""
                
                La deuxième équipe s'appelle \(teamTwo.teamName)
                
                """)
            }
        }
    }
    
    // Boucle de lancement du jeu
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

