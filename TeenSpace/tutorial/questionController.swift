//
//  questionController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/14/22.
//

import Foundation
import UIKit

class QuestionController{
    
    //var lblProgress: UILabel
    var questions: [Question]
    var answer0: UIButton
    var answer1: UIButton
    var answer2: UIButton
    var answer3: UIButton
    var progressBar: UIProgressView
    var lblQuestion: UITextView
    var answerButton: UIButton
    
    var viewController: UIViewController?
    
    var currentQuestion: Question?
    var currentQuestionPos = 0
    var noCorrect = 0
    
    var correctPicked = false
    var randomNum = 0
    

    
    init(questions: [Question],
         answer0: UIButton,
         answer1: UIButton,
         answer2: UIButton,
         answer3: UIButton,
         progressBar: UIProgressView,
         lblQuestion: UITextView,
         answerButton: UIButton)
    {
        //self.lblProgress = lblProgress
        self.questions = questions
        
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.progressBar = progressBar
        self.lblQuestion = lblQuestion
        self.answerButton = answerButton
    }
    
    
    func setController(questions: [Question],
         answer0: UIButton,
         answer1: UIButton,
         answer2: UIButton,
         answer3: UIButton,
         progressBar: UIProgressView,
         lblQuestion: UITextView,
         answerButton: UIButton)
    {
        //self.lblProgress = lblProgress
        self.questions = questions
        
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.progressBar = progressBar
        self.lblQuestion = lblQuestion
        self.answerButton = answerButton
    }
    
    func setViewController(viewController: UIViewController)
    {
        self.viewController = viewController
    }
    
    func updateProgressLabel()
    {
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
    }
    func resetStats()
    {
        currentQuestionPos = 0
        noCorrect = 0
        progressBar.progress = 0.0
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1)
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
    }
    
    func updateProgress()
    {
        progressBar.progress += 0.5 //Float(currentQuestionPos/questions.count)

        progressBar.setProgress(progressBar.progress, animated: true)
    }
    func checkAnswer(idx:Int)
    {
        if(idx == currentQuestion!.correctAnswer)
        {
            if(!correctPicked)
            {
                noCorrect += 1
            }
            
            //lblProgress.text = "\(noCorrect) / \(questions.count)"
            updateProgressLabel()
            updateProgress()
            answerButton.tintColor = UIColor.green
            correctPicked = true
        }
        else
        {
            answerButton.tintColor = UIColor.red
        }
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
        //loadNextQuestion()
    }
    
    func loadNextQuestion()
    {
        if(currentQuestionPos + 1 < questions.count)
        {
            currentQuestionPos += 1
        }
        else
        {
            
            showPerformanceAlert()
            resetStats()
        }
        currentQuestion = questions[currentQuestionPos]
        setQuestion()
        
    }
    func setQuestion()
    {
        lblQuestion.text = currentQuestion!.question
        
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        
        answer0.tintColor = UIColor.blue
        answer1.tintColor = UIColor.blue
        answer2.tintColor = UIColor.blue
        answer3.tintColor = UIColor.blue
        
        correctPicked = false
        
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
        
    }
    
    func generateRandomNumber(){
        randomNum = Int.random(in: 1...questions.count)
    }
    
    func showPerformanceAlert(){
        var message = "Try Again"
        if((noCorrect/questions.count)*100 >= 90)
        {
            message = "Good job"
        }
        let alert = UIAlertController(title: message, message: "Score: \(noCorrect)/\(questions.count)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        
        alert.addAction(action)
        //self.present(alert, animated: true, completion: nil)
        self.viewController?.present(alert, animated: true) {
            self.updateProgressLabel()
        }
    }
    
    func reset()
    {
        progressBar.progress = 0.0
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
        updateProgressLabel()
        currentQuestion = questions[0]
        setQuestion()
    }
    
}
