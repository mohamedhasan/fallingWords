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
        }) { (error) in
            self.delegate?.errorOccured()
        }
    }
    
    func switchLanguage(index: Int) {
        sourceLanguage = languagesDataSource[index]
        destLanguage = languagesDataSource[(index + 1) % languagesDataSource.count]
    }
    
}
