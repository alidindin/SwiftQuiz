//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Garrit Schaap on 30.05.16.
//  Copyright © 2016 Garrit Schaap. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOfQuestions: Int?
    var rightAnswers: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numberOfQuestions = numberOfQuestions, rightAnswers = rightAnswers {
            resultLabel.text = "Von \(numberOfQuestions) Fragen hast du \(rightAnswers) richtig beantwortet!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonHandler(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

}
