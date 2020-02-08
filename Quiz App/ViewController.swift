//
//  ViewController.swift
//  Quiz App
//
//  Created by Darren Rambaud on 02/03/2020.
//  Copyright © 2020 Darren Rambaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = "4 + 2 is equal to 6?"
    }

    @IBAction func answerReceived(_ sender: Any) {
    }
    
}

