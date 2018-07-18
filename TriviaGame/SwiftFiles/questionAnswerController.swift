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
    @IBOutlet weak var firstAnswerChoice: UILabel!
    @IBOutlet weak var secondAnswerChoice: UILabel!
    @IBOutlet weak var thirdAnswerChoice: UILabel!
    @IBOutlet weak var fourthAnswerChoice: UILabel!
    
    var info: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let info = info
        {
            questionLabel.text = info
        }
    }
    
}
