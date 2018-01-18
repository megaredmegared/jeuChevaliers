// **********************
// *   Logique du jeu   *
// **********************

class Game {
    var runGame = true // Paramètre du jeu actif ou non
    var teamOne: Team = Team(name: "") // comment éviter ce code redondant ???? <---------------------***
    var teamTwo: Team = Team(name: "")
    
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
        func createTeamOne() {
            if let teamName = readLine() {
                teamOne = Team(name: teamName)
                if teamName == "" { // vérification que le nom n'existe pas déjà ou qu'il n'y a rien d'entré
                    print(text.translation["checkName"]!)
                    createTeamOne()
                } else {
                    text.usedNames.append(teamOne.teamName)
                    teamOne.createMembers()
                }
            }
        }
        createTeamOne()
        
        // création de la deuxième équipe
        
        print(text.translation["createSecondTeamName"]!)
        func createTeamTwo() {
            if let teamName = readLine() {
                teamTwo = Team(name: teamName)
                if text.usedNames.contains(teamName) || teamName == "" { // vérification que le nom n'existe pas déjà ou qu'il n'y a rien d'entré
                    print(text.translation["checkName"]!)
                    createTeamTwo()
                } else {
                    text.usedNames.append(teamOne.teamName)
                    teamTwo.createMembers()
                }
            }
        }
        createTeamTwo()
        
        print("""
            
            \(teamOne.teamMember1.memberName), \(teamOne.teamMember2.memberName) et \(teamOne.teamMember3.memberName) de l'équipe \(teamOne.teamName)
            
            vont affronter
            
            \(teamTwo.teamMember1.memberName), \(teamTwo.teamMember2.memberName) et \(teamTwo.teamMember3.memberName) de l'équipe \(teamTwo.teamName)
            
            Que le meilleur gagne !!!
            
            """)
    }
    
    // Boucle de lancement du jeu
    
    func gameMenu() {
        while runGame {
            gameStart()
        }
    }
    
}

