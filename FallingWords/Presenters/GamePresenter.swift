//
//  GamePresenter.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

protocol GamePresenterProtocol {
    
    func updateTimer(time:Int)
    func updateScore(score:Int)
    func showNextQuestion(word:String,translation:String)
    func giveFeedBack(result:QuestionResult)
}

class GamePresenter: NSObject {

    var delegate : GamePresenterProtocol?
    let game = GameHandler.sharedInstance.game
    var timeCounter : Int
    var timer : Timer?
    var questionsIndex = -1
    let words : [String]!
    let translations : [String]!
    
    override init() {
        timeCounter = Game.gameTime
        words = game!.words
        translations = game!.translations[randomPick:game!.translations.count]
    }
    
    @objc func updateTime() {
        if timeCounter > 0 {
            timeCounter -= 1
            self.delegate?.updateTimer(time: timeCounter)
        } else {
            timer?.invalidate()
            endGame()
        }
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        showNextQuestion()
    }
    
    func showNextQuestion() {
        questionsIndex += 1
        if questionsIndex == words.count {
            endGame()
            return
        }
        self.delegate?.showNextQuestion(word: words[questionsIndex], translation: translations[questionsIndex])
    }
    
    func endGame() {
        timer?.invalidate()
        NotificationCenter.default.post(Notification(name:Notification.Name(rawValue: "gameEnded")))
    }
    
    func submitAnswer(answerType:AnswerType) {
        let result = GameHandler.sharedInstance.submitAnswer(word: words[questionsIndex], translation: translations[questionsIndex], answer: answerType)
        self.delegate?.updateScore(score: game!.score)
        self.delegate?.giveFeedBack(result: result)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            self.showNextQuestion()
        })
    }
    
    func noAnswer() {
        submitAnswer(answerType: .noAnswer)
    }
    
    func rightTranslation() {
        submitAnswer(answerType: .right)
    }
    
    func wrongTranslation() {
        submitAnswer(answerType: .wrong)
    }
}
