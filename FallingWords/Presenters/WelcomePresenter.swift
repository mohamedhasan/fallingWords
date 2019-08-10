//
//  WelcomePresenter.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

protocol WelcomePresenterProtocol {
    func wordsLoaded()
    func errorOccured()
    func handleClosingGame()
}

class WelcomePresenter: NSObject {

    var delegate : WelcomePresenterProtocol?
    let languagesDataSource = ["text_eng","text_spa"]
    var sourceLanguage = "text_eng"
    var destLanguage = "text_spa"
    
    func loadWords() {
        LanguageHandler.sharedInstance.loadWords(success: { () in
            GameHandler.sharedInstance.startNewGame(sourceLang: sourceLanguage, destLang: destLanguage)
            self.delegate?.wordsLoaded()
            self.addGameEndedListener()
        }) { (error) in
            self.delegate?.errorOccured()
        }
    }
    
    func addGameEndedListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.lastGameEnded(notification:)), name: Notification.Name("gameEnded"), object: nil)
    }
    
    func switchLanguage(index: Int) {
        sourceLanguage = languagesDataSource[index]
        destLanguage = languagesDataSource[(index + 1) % languagesDataSource.count]
    }
    
    @objc func lastGameEnded (notification: Notification) {
        self.delegate?.handleClosingGame()
    }
        
        
    
}
