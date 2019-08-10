//
//  GameHandlerTest.swift
//  FallingWordsTests
//
//  Created by Hasan on 8/10/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import XCTest

class GameHandlerTest: XCTestCase {

    override func setUp() {
        LanguageHandler.sharedInstance.loadWords(success: {
        }) { (error) in}
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStartNewGame() {
        GameHandler.sharedInstance.startNewGame(sourceLang: "text_eng", destLang: "text_spa")
        let game = GameHandler.sharedInstance.game
        XCTAssertNotEqual(game, nil)
    }
    
    func testStartNewGameHasWords() {
        GameHandler.sharedInstance.startNewGame(sourceLang: "text_eng", destLang: "text_spa")
        let game = GameHandler.sharedInstance.game
        XCTAssertGreaterThan((game?.words.count)!, 0)
    }
    
    func testStartNewGameHasTranslations() {
        GameHandler.sharedInstance.startNewGame(sourceLang: "text_eng", destLang: "text_spa")
        let game = GameHandler.sharedInstance.game
        XCTAssertGreaterThan((game?.translations.count)!, 0)
    }
    

}
