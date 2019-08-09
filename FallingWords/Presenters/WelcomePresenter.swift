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
    
    func loadWords() {
        LanguageHandler.sharedInstance.loadWords(success: { () in
            self.delegate?.wordsLoaded()
        }) { (error) in
            self.delegate?.errorOccured()
        }
    }
    
    func switchLanguage(index: Int) {
        
    }
    
}
