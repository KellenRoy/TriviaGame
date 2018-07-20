//
//  endScreenController.swift
//  TriviaGame
//
//  Created by Kellen Roy on 7/20/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class endScreenController: UIViewController {
 
    var score: Int?
    
    @IBOutlet weak var endTextLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        endTextLabel.text = "You scored \(score!)/10!"
        setUpViews()
    }
    
    func setUpViews() {
        playAgainButton.layer.cornerRadius = 8
        playAgainButton.layer.masksToBounds = true
    }
    
  @IBAction func playAgainButtonPressed(_ sender: Any) {
    performSegue(withIdentifier: "playAgainSegue", sender: self)
    }
    
    
}
