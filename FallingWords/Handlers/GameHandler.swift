//
//  GameHandler.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

enum AnswerType {
    case right
    case wrong
    case noAnswer
}

enum QuestionResult {
    case right
    case wrong
    case noAnswer
}

class GameHandler: NSObject {

    static let sharedInstance = GameHandler()
    var game : Game?
    
    private override init() {
        super.init()
    }
    
    func startNewGame(sourceLang:String,destLang:String) {
        game = Game(sourceLang: sourceLang, destLang: destLang)
        let wordsTranslations : ([String],[String]) = createQuestionsAnswersTuples(size: Game.numberOfQuestions)
        game?.words = wordsTranslations.0
        game?.translations = wordsTranslations.1
    }
    
    func submitAnswer(word:String,translation:String,answer:AnswerType) -> (QuestionResult){
        
        let rightTranslation = game?.rightTranslation(word: word)
        let translationCorrect = rightTranslation == translation
        var result : QuestionResult
        
        switch answer {
        case .right:
            result = translationCorrect ? .right : .wrong
            game?.updateScore(scoreChange: translationCorrect ? 1 : -1)
            break
        case .wrong:
            result = translationCorrect ? .wrong : .right
            game?.updateScore(scoreChange: translationCorrect ? -1 : 1)
            break
        default:
            result = .noAnswer
            break
        }
        
        return result
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


