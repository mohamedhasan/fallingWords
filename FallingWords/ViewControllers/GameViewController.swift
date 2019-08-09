//
//  GameViewController.swift
//  FallingWords
//
//  Created by Hasan on 8/9/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {

    @IBOutlet weak var viewCorrect : UIView?
    @IBOutlet weak var viewFalse : UIView?
    @IBOutlet weak var labelTimer : UILabel?
    @IBOutlet weak var labelCounter : UILabel?
    @IBOutlet weak var labelTranslation : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func gameViewController() -> GameViewController? {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: "gameViewController") as? GameViewController
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
