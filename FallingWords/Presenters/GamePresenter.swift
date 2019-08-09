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
    func giveFeedBack(positive:Bool)
}

class GamePresenter: NSObject {

    var delegate : GamePresenterProtocol?
    let game = GameHandler.sharedInstance.game
    var timeCounter : Int
    var timer : Timer?
    
    override init() {
        timeCounter = Game.gameTime
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
    }
    
    func endGame() {
        
    }
}
