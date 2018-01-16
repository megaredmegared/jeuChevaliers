class TextAndTranslation {
    
    var translation = ["": ""]
    
    let language = "fr"
    
    // MARK: Traduction en français
    
    let textFr = [

        "startMenu": """
        
        Choisissez parmis une des c'est trois options
        
        1. Jouer        2. Afficher la régle du jeu        3. Quitter
        
        """,
        
        "gameRules": """
        
        Règle du jeu :
        Ceci est un jeu de combat tour par tour où deux équipes de trois personnages vont devoir s'affronter.
        La première équipe à tuer tous les personnages de l'équipe adverse, gagne la partie.
        
        """,
        
        "selectionError": """
        
        ***   Vous n'avez pas une des options proposées   ***
        
        """,
        
        "createTeamName": """
        
        Veuillez entrer un nom pour la première équipe
        
        """,
        
        "chooseFirstTeamMember": """
        
        Choisissez le nom de votre premier personnage !
        
        """,
        
        "chooseSecondTeamMember": """
        
        Choisissez le nom de votre deuxième personnage !
        
        """,
        
        "chooseThirdTeamMember": """
        
        Choisissez le nom de votre troisième personnage !
        
        """]
    
    // MARK: Traduction en Anglais
    
    let textEn = ["askMenu": "Choose a persona"] // à faire une fois tout le texte tappé
    
    
    // MARK: Choix de la langue
    
    func choose(language: String) {
        if language == "fr" {
            translation = textFr
        } else if language == "en" {
            translation = textEn
        }
    }
    
    // MARK: Initialisation en Français par défaut
    
    init() {
        translation = textFr
    }
}



