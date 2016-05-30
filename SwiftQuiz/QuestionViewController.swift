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
    
    var questions: [Question]?
    var question: Question?
    var currentQuestion = 1
    var numberOfQuestions = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let questions = questions else {
            return
        }
        
        title = "Frage \(currentQuestion)"
        
        let index = Int(arc4random()) % questions.count
        question = questions[index]
        self.questions?.removeAtIndex(index)
        
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
            rightAnswers += 1
            button.backgroundColor = UIColor.greenColor()
            
            let alertController = UIAlertController(title: "Richtig", message: "Super!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "🤘", style: .Default) { (_) in
                self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            print("Falsch")
            button.backgroundColor = UIColor.redColor()
            
            let alertController = UIAlertController(title: "Falsch", message: "Du bist doof!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "👎", style: .Default) { (_) in
                self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    private func showNextQuestion() {
        if questions?.count > 0 {
            // Here is the code to call another Storyboard ViewController without our hack
            if let viewController = storyboard?.instantiateViewControllerWithIdentifier("QuestionViewController") {
                let segue = UIStoryboardSegue(identifier: nil, source: self, destination: viewController, performHandler: {
                    self.navigationController?.pushViewController(viewController, animated: true)
                })
                self.prepareForSegue(segue, sender: nil)
                segue.perform()
            }
            // This is the code for our hack
//            performSegueWithIdentifier("ShowQuestion", sender: nil)
        } else {
            if let viewController = storyboard?.instantiateViewControllerWithIdentifier("ResultScreen") as? ResultViewController {
                viewController.rightAnswers = rightAnswers
                viewController.numberOfQuestions = numberOfQuestions
                self.navigationController?.pushViewController(viewController, animated: true)
            }
//            navigationController?.popToRootViewControllerAnimated(true)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? QuestionViewController {
            controller.questions = questions
            controller.currentQuestion = currentQuestion + 1
            controller.rightAnswers = rightAnswers
            controller.numberOfQuestions = numberOfQuestions
        }
    }

}
