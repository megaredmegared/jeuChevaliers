
/// Class for translation of the game.

class TextAndTranslation {
    
    /// Dictionary to stock the selected language.
    
    var translation = ["": ""]
 
    /// Property to select a language.
    
    let language = "fr"
    
    /// Collected names used for teams and charachters.
    
    var usedNames = [""]
 
    /// French translation.
    
    let textFr = [
        
        "startMenu": """
        
        ***   Choisissez parmis une de c'est quatre options !   ***
        
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
        
        ***   Choisissez le nom de votre premier personnage !   ***
        
        """,
        
        "chooseSecondTeamMember": """
        
        ***   Choisissez le nom de votre deuxième personnage !   ***
        
        """,
        
        "chooseThirdTeamMember": """
        
        ***   Choisissez le nom de votre troisième personnage !   ***
        
        """,
        
        "chooseLanguage": """
        
        Choisissez la langue du jeu :
        
        1. Français        2. English
        
        """,
        
        "chooseMemberSpeciality": """
        
        ***   Choisissez la spécialité du personnage !   ***
        
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
        "cudgel": "gourdin",
        "magic wand": "baguette magique",
        "sword": "épée",
        "excalibur": "excalibur",
        "healing flask": "fiole de vie",
        "golden magic wand": "baguette magique dorée",
        "golden axe": "hache en or",
        "dead spell": "sortilège mortel",
        "poison flask": "fiole de poison",
        "magic egg": "oeuf sacré",
        "the": "le",
        "life": "vie",
        "attack": "attaque",
        "The team": "L'équipe",
        "letTheBestWin": "Que le meilleur gagne !!!",
        "selectDeadMember": "Vous ne pouvez pas selectioner ce personnage car il est mort",
        "chooseMember": "***   Choisis parmis ces 3 personnages   ***",
        "opponentTeam": "Opposée à l'équipe",
        "chooseAttacker": """
        
        ***   Choisis ton attaquant !!!   ***
        
        """,
        "chooseOpponent": """
        
        Choisis le personnage que tu veux attaquer !!!
        
        """,
        "chooseSomeoneToHeal": """
        
        ***   Choisis un personnage de ton équipe à guérrir !!!   ***
        
        """,
        "noBonusWeapon": """
        
        *************************************************
        ***   Vous n'aves pas reçu d'arme bonus !!!   ***
        *************************************************
        
        """,
        "bonusReceived": "Vous avez reçu le bonus",
        "maxMage": """

        ***   Vous ne pouvez pas avoir plus de 1 mage par équipe séléctionez une autre specialité  !!!  ***

        """,
        "has attacked": "a attaqué",
        "has healed": "a soigné",
        "times": "fois",
        "hasWon": "a gagnée, félicitation au joueur !!!",
        "statitisticsMenu": """
        
        ***   Choisissez parmis une de ces trois options   ***
        
        1. Afficher les statistiques        2. Revenir au menu principal        3. Quitter le jeu
        
        """,
        "youPlayed": "Vous avez combattu pendant",
        "minutes": "minutes",
        ]
 
    /// English translation.
    
    let textEn = [
        
        "startMenu": """
        
        ***   Choose from one of these four options !   ***
        
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
        
        ***   Choose the name of your first character !   ***
        
        """,
        
        "chooseSecondTeamMember": """
        
        ***   Choose the name of your second character !   ***
        
        """,
        
        "chooseThirdTeamMember": """
        
        ***   Choose the name of your third character !   ***
        
        """,
        
        "chooseLanguage": """
        
        Choose the language of the game :
        
        1. Français        2. English
        
        """,
        
        "chooseMemberSpeciality": """
        
        ***   Choose the specialty of the character !   ***
        
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
        "sword": "sword",
        "excalibur": "excalibur",
        "healing flask": "healing flask",
        "golden magic wand": "golden magic wand",
        "golden axe": "golden axe",
        "dead spell": "dead spell",
        "poison flask": "poison flask",
        "magic egg": "magic egg",
        "the": "the",
        "life": "life",
        "attack": "attack",
        "The team": "The team",
        "letTheBestWin": "Let the best win !!!",
        "selectDeadMember": "You can't select this character because is already dead !",
        "chooseMember": "***   Choose from these 3 characters   ***",
        "opponentTeam": "Opposed to the team",
        "chooseAttacker": """
        
        ***   Choose your attacker !!!   ***
        
        """,
        "chooseOpponent": """
        
        Choose the character you want to attack !!!
        
        """,
        "chooseSomeoneToHeal": """

        ***   Choose a character from your team to heal !!!   ***

        """,
        "noBonusWeapon": """
        
        ****************************************************
        ***   You have not received a bonus weapon !!!   ***
        ****************************************************
        
        """,
        "bonusReceived": "You received the bonus",
        "maxMage": """
        
        ***   You can not have more than 1 mage per team select another specialty !!!   ***
        
        """,
        "has attacked": "has attacked",
        "has healed": "has healed",
        "times": "times",
        "hasWon": "has won, congratulations to the player !!!",
        "statitisticsMenu": """
        
        ***   Choose one of these three options   ***
        
        1. View Statistics        2. Return to Main Menu        3. Exit Game
        
        """,
        "youPlayed": "You fighted during",
        "minutes": "minutes",
        ]
    
    /// Choose the language.
    
    func enable(language: String) {
        if language == "fr" {
            translation = textFr
        } else if language == "en" {
            translation = textEn
        }
    }
 
    /// Display choice menu of the languages.
    
    func languageChoice() {
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
    
    /// Initialization by default in French.
    
    init() {
        translation = textFr
    }
}



