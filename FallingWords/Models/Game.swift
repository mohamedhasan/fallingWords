//
//  Game.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

enum GameLevel {
    case easy
    case normal
    case expert
}

class Game: NSObject {

    static let gameTime = 120
    static let numberOfQuestions = 20
    static let questionTime = 6
    private var scoreHolder : Int = 0
    var score : Int {
        return scoreHolder
    }
    
    var timeSpent : Int = 0
    
    //level to be used in future:
    var level : GameLevel?
    var sourceLang : String
    var destLang : String
    
    var words : [String] = []
    var translations : [String] = []
    var results : [String] = []
    
    init(sourceLang:String,destLang:String) {
        self.sourceLang = sourceLang
        self.destLang = destLang
    }
    
    func rightTranslation(word:String) -> String {
        if let index = words.firstIndex(of: word) {
            return translations[index]
        }
        return ""
    }
    
    //Score will never be below ZERO
    func updateScore(scoreChange:Int) {
        if scoreHolder + scoreChange > 0 {
            scoreHolder = scoreHolder + scoreChange
        }
    }
    
}
