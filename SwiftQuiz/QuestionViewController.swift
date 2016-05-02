//
//  QuestionViewController.swift
//  SwiftQuiz
//
//  Created by Garrit Schaap on 18.04.16.
//  Copyright © 2016 Garrit Schaap. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = question?.text
        answer1Button.setTitle(question?.answer1, forState: .Normal)
        answer2Button.setTitle(question?.answer2, forState: .Normal)
        answer3Button.setTitle(question?.answer3, forState: .Normal)
        answer4Button.setTitle(question?.answer4, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1ButtonHandler(sender: UIButton) {
        checkAnswer(1, button: sender)
    }
    
    @IBAction func answer2ButtonHandler(sender: UIButton) {
        checkAnswer(2, button: sender)
    }
    
    @IBAction func answer3ButtonHandler(sender: UIButton) {
        checkAnswer(3, button: sender)
    }
    
    @IBAction func answer4ButtonHandler(sender: UIButton) {
        checkAnswer(4, button: sender)
    }
    
    private func checkAnswer(index: Int, button: UIButton) {
        if index == question?.rightAnswer {
            print("Richtig")
            button.backgroundColor = UIColor.greenColor()
            
            let alertController = UIAlertController(title: "Richtig", message: "Super!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "🤘", style: .Default) { (_) in
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            print("Falsch")
            button.backgroundColor = UIColor.redColor()
            
            let alertController = UIAlertController(title: "Falsch", message: "Du bist doof!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "👎", style: .Default) { (_) in
                self.navigationController?.popToRootViewControllerAnimated(true)
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
