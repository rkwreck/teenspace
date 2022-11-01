//
//  questionsTemplate.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/13/22.
//

import Foundation

/*
struct Question{
    let question: String
    let answers:  [String]
    let correctAnswer: Int
}
*/

class Question{
    let question: String
    let answers:  [String]
    let correctAnswer: Int
    let detail:   String
    
    init(question: String, answers: [String],correctAnswer:Int, detail: String)
    {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.detail = detail
    }
}
