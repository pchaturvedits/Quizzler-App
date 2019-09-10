//
//  ViewController.swift
//  Quizzler app
//
//  Created by Manish Chaturvedi on 9/9/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var questionNumber = 0
    var score = 0
    var pickedAnswer: Bool = false
    var question = QuestionBank()
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var answeredQuestionLbl: UILabel!
   
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
  
       updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerPressedBtn(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
                pickedAnswer = false
            }
        checkAnswer()
        questionNumber = questionNumber + 1
        updateUI()
        }
        
    
    func updateUI(){
    scoreLbl.text = "Score: \(score)"
    answeredQuestionLbl.text = "\(questionNumber + 1)/13"
    progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber)
        nextQuestion()
    }
    func checkAnswer(){
        let firstAnswer = question.list[questionNumber].answer
        if firstAnswer == pickedAnswer{
            ProgressHUD.showSuccess("Correct")
            ;
            score = score + 1
        }
        else{
            ProgressHUD.showError("Wrong")
        }
    }
    
    func nextQuestion(){
     
        if questionNumber <= 12 {
       
            questionLbl.text = question.list[questionNumber].questionText
            
        }
            else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.restart()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
   
    func restart(){
        questionNumber = 0
        score = 0
        updateUI()
    }
    
    
    
}

