//
//  LanguageHandler.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class LanguageHandler: NSObject {

    static let sharedInstance = LanguageHandler()
    var wordsList:[[String:String]] = []
    
    private override init() {
        super.init()
    }
    
    func loadWords(success:()->Void,errorHandler:(Error?)->Void) {
        
        if let path = Bundle.main.path(forResource: "words", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [[String:String]]{
                    wordsList = jsonResult
                    success()
                }
            } catch {
                errorHandler(error)
            }
        } else {
            errorHandler(nil)
        }
    }
}
