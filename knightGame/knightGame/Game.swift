// **********************
// *   Logique du jeu   *
// **********************

class Game {
    var runGame = true // Paramètre du jeu actif ou non
    
    
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
                runGame = false
                
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
            let teamOne = TeamOne(name: teamName) // création de la première équipe
            print("""
                
                La première équipe s'appelle \(teamOne.teamName)
                
                """)
            print("""

            Choisissez le nom de votre premier personnage:

            """)
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

