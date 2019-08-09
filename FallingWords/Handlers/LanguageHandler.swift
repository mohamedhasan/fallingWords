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
    
    func randomWordsCollection(size:Int) -> [[String:String]] {
        let actualSize = min(size, wordsList.count)
        if actualSize == 0 {
            return []
        }
        return wordsList[randomPick:actualSize]
    }
    
}

/**
 I used this code from to pick random collection of the question and show the user in each test :
 code source : https://stackoverflow.com/a/45011690
 **/
extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}
