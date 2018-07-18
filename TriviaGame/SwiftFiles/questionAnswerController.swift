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
    var answer: String?
    var answerDisplay2: String?
    var answerDisplay3: String?
    var answerDisplay4: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info
        {
            questionLabel.text = info
        }
        
        if let answer = answer
        {
            answerA.setTitle(answer, for: .normal)
        }
        
        if let answerDisplay2 = answerDisplay2
        {
            answerB.setTitle(answerDisplay2, for: .normal)
        }
        
        if let answerDisplay3 = answerDisplay3
        {
            answerC.setTitle(answerDisplay3, for: .normal)
        }
        
        if let answerDisplay4 = answerDisplay4
        {
            answerD.setTitle(answerDisplay4, for: .normal)
        }
    }
    
}
