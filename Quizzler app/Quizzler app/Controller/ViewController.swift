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
    var pickedAnswer: Bool = false
    var question = QuestionBank()
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var answeredQuestionLbl: UILabel!
    @IBOutlet weak var progressBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
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
        nextQuestion()
        }
        
    
    func updateUI(){
        
    }
    
    func nextQuestion(){
        questionNumber = questionNumber + 1
        if questionNumber <= 12 {
            let firstQuestion = question.list[questionNumber]
            questionLbl.text = firstQuestion.questionText
        }
            else {
            print("Quiz End")
            restart()
        }
    }
    func checkAnswer(){
       let firstAnswer = question.list[questionNumber].answer
        if firstAnswer == pickedAnswer{
        print("correct")
        }
        else{
            print("wrong")
        }
    }
    func restart(){
        questionNumber = 0
    }
    
    
    
}

