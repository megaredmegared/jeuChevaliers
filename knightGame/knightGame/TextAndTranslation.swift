class TextAndTranslation {
    
    var translation = ["": ""]
    
    let language = "fr"
    
    var usedNames = [""] // Stock les noms utilisés pour les équipes et les personnages
    
    // MARK: Traduction en français
    
    let textFr = [
        
        "startMenu": """
        
        Choisissez parmis une des c'est quatre options !
        
        1. Jouer        2. Afficher la régle du jeu        3. Choix de la langue        4. Quitter
        
        """,
        
        "gameRules": """
        
        Règle du jeu :
        Ceci est un jeu de combat tour par tour où deux équipes de trois personnages vont devoir s'affronter.
        La première équipe à tuer tous les personnages de l'équipe adverse, gagne la partie.
        
        """,
        
        "selectionError": """
        
        ***   Vous n'avez pas entré un choix parmis une des options proposées   ***
        
        """,
        
        "createFirstTeamName": """
        
        ***   Veuillez entrer un nom pour la première équipe   ***
        
        """,
        
        "createSecondTeamName": """
        
        ***   Veuillez entrer un nom pour la deuxième équipe   ***
        
        """,
        
        "chooseFirstTeamMember": """
        
        Choisissez le nom de votre premier personnage !
        
        """,
        
        "chooseSecondTeamMember": """
        
        Choisissez le nom de votre deuxième personnage !
        
        """,
        
        "chooseThirdTeamMember": """
        
        Choisissez le nom de votre troisième personnage !
        
        """,
        
        "chooseLanguage": """
        
        Choisissez la langue du jeu :
        
        1. Français        2. English
        
        """,
        
        "chooseMember": """
        
        Choisissez la spécialité du personnage !
        
        1. Nain        2. Guerrier        3. Colosse        4. Mage
        
        """,
        
        "checkName": """
        
        ***   Ce nom est déjà pris ou vous n'avez pas rentré de nom, veuillez recommencer !   ***
        
        """,
        "Dwarf": "Nain",
        "Warrior": "Guerrier",
        "Mage": "Mage",
        "Colossus": "Colosse",
        "axe": "hache",
        "cudgel": "goudin",
        "magic wand": "baguette magique",
        "sword": "épée"
        ]
    
    // MARK: Traduction en Anglais
    
    let textEn = [
        
        "startMenu": """
        
        Choose from one of the four options !
        
        1. Play        2. Show game rules        3. Choose language     4. Exit
        
        """,
        
        "gameRules": """
        
        Rule of the game :
        This is a turn-based fighting game where two teams of three characters will have to fight each other.
        The first team to kill all the characters of the opposing team wins the game.
        
        """,
        
        "selectionError": """
        
        ***   You have not entered a choice among any of the options offered   ***
        
        """,
        
        "createFirstTeamName": """
        
        ***   Please enter a name for the first team   ***
        
        """,
        
        "createSecondTeamName": """
        
        ***   Please enter a name for the second team   ***
        
        """,
        
        "chooseFirstTeamMember": """
        
        Choose the name of your first character !
        
        """,
        
        "chooseSecondTeamMember": """
        
        Choose the name of your second character !
        
        """,
        
        "chooseThirdTeamMember": """
        
        Choose the name of your third character !
        
        """,
        
        "chooseLanguage": """
        
        Choose the language of the game :
        
        1. Français        2. English
        
        """,
        
        "chooseMember": """
        
        Choose the specialty of the character!
        
        1. Dwarf        2. Warrior        3. Colossus        4. Mage
        
        """,
        
        "checkName": """
        
        ***   This name is already taken or you have not writen anything, please start again !   ***
        
        """,
        "Dwarf": "Dwarf",
        "Warrior": "Warrior",
        "Mage": "Mage",
        "Colossus": "Colossus",
        "axe": "axe",
        "cudgel": "cudgel",
        "magic wand": "magic wand",
        "sword": "sword"
        ]
    
    
    // MARK: Choix de la langue
    
    func enable(language: String) {
        if language == "fr" {
            translation = textFr
        } else if language == "en" {
            translation = textEn
        }
    }
    
    // Affichage du menu du choix de la langue
    
    func languageChoice() { // problème mettre instance ou class comme ref  <-----------------------***
        print(text.translation["chooseLanguage"]!)
        if let choice = readLine() {
            switch choice {
                
            case "1" :
                self.enable(language: "fr")
                
            case "2" :
                self.enable(language: "en")
                
            default :
                print(self.translation["selectionError"]!)
                self.languageChoice()
            }
        }
    }
    
    // Initialisation en Français par défaut
    
    init() {
        translation = textFr
    }
}



