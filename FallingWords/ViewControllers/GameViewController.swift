//
//  GameViewController.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController,GamePresenterProtocol {

    let presenter = GamePresenter()
    
    @IBOutlet weak var viewCorrect : UIView?
    @IBOutlet weak var viewFalse : UIView?
    @IBOutlet weak var viewHeader : UIView?
    @IBOutlet weak var labelTimer : UILabel?
    @IBOutlet weak var labelScore : UILabel?
    @IBOutlet weak var labelTranslation : UILabel?
    @IBOutlet weak var labelWordPlaceholder : UIView?
    @IBOutlet weak var buttonRight : UIButton?
    @IBOutlet weak var buttonWrong : UIButton?
    
    var labelWord : UILabel?
    @IBOutlet weak var labelWordTop : NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.startGame()
    }
    
    static func gameViewController() -> GameViewController? {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "gameViewController") as? GameViewController
    }

    
    @objc func detectCollision() {
        if (labelWord!.frame.intersects(labelTranslation!.frame)) {
            self.resetWord()
            self.presenter.noAnswer()
        }
    }
    
    func showNextQuestion(word:String,translation:String) {
        self.viewHeader?.backgroundColor = .clear
        self.labelTranslation?.text = translation
        showFallingWord(word: word)
    }
    
    func showFallingWord(word:String) {
        
        buttonRight?.isEnabled = true
        buttonWrong?.isEnabled = true
        labelWord = UILabel()
        labelWord?.frame = labelWordPlaceholder!.frame
        labelWord?.font = labelTranslation?.font
        labelWord?.textAlignment = .center
        labelWord?.textColor = .red
        self.view.addSubview(labelWord!)
        labelWord?.text = "\(word)"
        
        UIView.animate(withDuration: TimeInterval(Game.questionTime), animations: {
            self.labelWord?.center.y = self.view.frame.size.height
        }, completion: { (finished: Bool) in
            if finished {
                self.resetWord()
                self.presenter.noAnswer()
            }
        })
    }
    
    func resetWord() {
        self.labelWord?.text = ""
        self.labelWord?.removeFromSuperview()
    }
    
    func updateTimer(time:Int) {
        self.labelTimer?.text =  "\(time)"
    }
    
    func updateScore(score:Int) {
        self.labelScore?.text =  "\(score)"
    }
    
    func giveFeedBack(result:QuestionResult) {
        
        let color = self.feedbackColor(result)
        buttonRight?.isEnabled = false
        buttonWrong?.isEnabled = false
        UIView.animate(withDuration: 1, animations: {
            self.viewHeader?.backgroundColor = color
        })
    }
    
    func feedbackColor(_ result:QuestionResult) -> UIColor {
        var feedbackColor : UIColor = .clear
        if result == .noAnswer {
            feedbackColor = .yellow
        } else if result == .right {
            feedbackColor = .green
        } else if result == .wrong {
            feedbackColor = .red
        }
        return feedbackColor
    }
    
    @IBAction func submitRight() {
        self.resetWord()
        self.presenter.rightTranslation()
    }
    
    @IBAction func submitWrong() {
        self.resetWord()
        self.presenter.wrongTranslation()
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
