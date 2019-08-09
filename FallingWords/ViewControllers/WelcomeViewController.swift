//
//  WelcomeViewController.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController,WelcomePresenterProtocol {
    
    let presenter = WelcomePresenter()
    
    @IBOutlet weak var startButton : UIButton?
    @IBOutlet weak var languageSegmentedControl : UISegmentedControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    @IBAction func start() {
        startButton?.isEnabled = false
        presenter.loadWords()
    }
    
    @IBAction func switchLanguage() {
        presenter.switchLanguage(index: languageSegmentedControl?.selectedSegmentIndex ?? 0)
    }
    
    func wordsLoaded() {
        startButton?.isEnabled = true
        if let gameVC = GameViewController.gameViewController() {
            self.present(gameVC, animated: true, completion: nil)
        }
    }
    func errorOccured() {
        //Show some error to the user :)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
