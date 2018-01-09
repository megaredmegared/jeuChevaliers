// **********************
// *   Logique du jeu   *
// **********************

class Game {
    
    // Affichage au démarrage du jeu
    
    func gameStart() {
        print("""
         
        Choisissez parmis une des c'est trois options

        1. Jouer        2. Afficher la régle du jeu        3. Quitter

        """)
        if let choice = readLine() {
            switch choice {
                
            case "1" : // On commence à jouer
                createTeam()
                
            case "2" : // On affiche la règle du jeu
                gameRules()
                
            case "3" : // On quitte le jeu
                gameMenu(run: false)
                
            default : // On affiche un message d'erreur pour tout saisie invalide
                print("""

                ***   Vous n'avez pas choisi le bon nombre   ***

                """)
                gameStart()
            }
        }
    }
    
    
    // Affichage de la régle du jeu
    
    func gameRules() {
        print("""

        Règle du jeu :
        Ceci est un jeu de combat tour par tour où deux équipes de trois personnages vont devoir s'affronter.
        La première équipe à tuer tous les personnages de l'équipe adverse, gagne la partie.

        """)
    }
    
    // Création des équipes
    
    func createTeam() {
        print("""
        
        Veuillez entrer un nom pour la première équipe

        """)
        
        if let teamName = readLine() {
            let teamOne = Team(name: teamName) // création de la première équipe
            print("""
                
                La première équipe s'appelle \(teamOne.teamName)
                
                """)
            if let teamName = readLine() {
                let teamTwo = Team(name: teamName) // création de la deuxième équipe
                print("""
                    
                    La première équipe s'appelle \(teamTwo.teamName)
                    
                    """)
            }
            
        }
        
        // Boucle du menu à revoir pour prendre stop ou run en paramètre ????????????? <-------------------------------
        
        func gameMenu(run: Bool) {
            while run {
                gameStart()
            }
        }
        
}
