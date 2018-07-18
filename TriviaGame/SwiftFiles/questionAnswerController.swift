//
//  questionAnswerController.swift
//  TriviaGame
//
//  Created by Arnav Gupta on 7/18/18.
//  Copyright © 2018 Make School. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class questionAnswerController: UIViewController
{
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    static var score = 0
    
    var info: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info
        {
            questionLabel.text = info
        }
    }
    
}
