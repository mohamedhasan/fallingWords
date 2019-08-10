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
    var gameViewController : GameViewController?
    
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
            gameViewController = gameVC
            self.present(gameVC, animated: true, completion: nil)
        }
    }
    func errorOccured() {
        //Show some error to the user :)
    }
    
    //Dismiss GameViewController and Show user Last Score
    func handleClosingGame() {
        gameViewController?.dismiss(animated: true, completion: {
            self.showlastGameAlert()
        })
    }
    
    func showlastGameAlert() {
        
        let message = String(format: "your last score is %ld", GameHandler.sharedInstance.game?.score ?? 0)
        let alertController = UIAlertController(title: "Congrats", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
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
