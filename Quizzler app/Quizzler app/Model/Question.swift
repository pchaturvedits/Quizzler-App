//
//  Question.swift
//  Quizzler app
//
//  Created by Manish Chaturvedi on 9/9/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import Foundation
class Question{
    let questionText:String
    let answer:Bool
    init(text:String, correctAnswer:Bool){
    questionText = text
    answer = correctAnswer
    }
}
