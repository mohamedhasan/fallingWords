//
//  GameHandler.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class GameHandler: NSObject {

    static let sharedInstance = GameHandler()
    var game : Game?
    
    private override init() {
        super.init()
    }
    
    func startNewGame(sourceLang:String,destLang:String) {
        game = Game(sourceLang: sourceLang, destLang: destLang)
        let wordsTranslations : ([String],[String]) = createQuestionsAnswersTuples(size: 15)
        game?.words = wordsTranslations.0
        game?.translations = wordsTranslations.1
    }
    
    private func createQuestionsAnswersTuples(size:Int) -> ([String],[String]) {
        
        var words = [String]()
        var translations = [String]()
        
        if let currentGame = game {
         
            let randomWords = LanguageHandler.sharedInstance.randomWordsCollection(size: size)
            
            for i in 0...randomWords.count - 1 {
                var wordDictionary = randomWords[i]
                words.append(wordDictionary[currentGame.sourceLang] ?? "")
                translations.append(wordDictionary[currentGame.destLang] ?? "")
            }
        }
        return (words,translations)
    }
    
}


