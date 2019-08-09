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

    
    var score : Double = 0.0
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
    
}
