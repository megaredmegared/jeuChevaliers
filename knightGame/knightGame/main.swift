//
//  main.swift
//  knightGame
//
//  Created by megared on 27/12/2017.
//  Copyright © 2017 megared. All rights reserved.

import Foundation

/// Property for text translation to be available in all class.

var text = TextAndTranslation()

/// Property for fighters to be available in all class.

var fighter = Fighters()

/// Property for weapons to be available in all class.

let weapon = Weapons()

/// Property for team to be available in all class.

var team = [Team(name: ""), Team(name: "")]

/// Property for each player statistics to be available in all class.

var playersStatistics = [Statistics(), Statistics()]

/// Property to store mesured elapsed time to be available in all class.

var gameTime: Int

/// Initiate a starting point to run the game.

let play = Game()
play.gameMenu()


