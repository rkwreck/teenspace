//
//  ThirdViewController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/11/22.
//

import UIKit

class ThirdViewController: UIViewController {

    
    let questions = cyberQuestions.shuffled()
    
    
    var currentQuestion: Question?
    
    var currentQuestionPos = 0
    var noCorrect = 0
    var answerButton: UIButton?
    var correctPicked = false
    var randomNum = 0
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var lblProgress: UILabel!
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        loadNextQuestion()
    }
    @IBAction func option1(_ sender: UIButton) {
        answerButton = answer0
        checkAnswer(idx: 0)
    }
    
    @IBAction func option2(_ sender: UIButton) {
        answerButton = answer1
        checkAnswer(idx: 1)
    }
    
    @IBAction func option3(_ sender: UIButton) {
        answerButton = answer2
        checkAnswer(idx: 2)
    }
    
    
    @IBAction func option4(_ sender: UIButton) {
        answerButton = answer3
        checkAnswer(idx: 3)
    }
   
    
    func updateProgressLabel()
    {
        lblProgress.text = "\(currentQuestionPos+1) / \(questions.count)"
        //lblProgress.text = "\(currentQuestionPos+1) / 25"
    }
    func resetStats()
    {
        currentQuestionPos = 0
        noCorrect = 0
    }
    
    func updateProgress()
    {
        
    }
    func checkAnswer(idx:Int)
    {
        var choice = "Correct"
        if(idx == currentQuestion!.correctAnswer)
        {
            if(!correctPicked)
            {
                noCorrect += 1
            }
            
            //lblProgress.text = "\(noCorrect) / \(questions.count)"
            updateProgressLabel()
            updateProgress()
            answerButton!.tintColor = UIColor.green
            correctPicked = true
        }
        else
        {
            choice = "Wrong"
            answerButton!.tintColor = UIColor.red
        }
        showDetailAlert(detail:questions[currentQuestionPos].detail,choice:choice)
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
        //loadNextQuestion()
    }
    @IBAction func goBackBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
            //showPerformanceAlertWithImage2()
            //updateProgressLabelCompleted()
            
            resetStats()
        }
        currentQuestion = questions[currentQuestionPos]
        setQuestion()
        
        updateProgressLabel()
        
        
        
    }
    func setQuestion()
    {
        lblQuestion.text = currentQuestion!.question
        
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        
        
        answer0.tintColor = UIColor.orange
        answer1.tintColor = UIColor.orange
        answer2.tintColor = UIColor.orange
        answer3.tintColor = UIColor.orange
         
        
        correctPicked = false
        
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
        
    }
    
    func generateRandomNumber(){
        randomNum = Int.random(in: 1...questions.count)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        updateProgressLabel()
        currentQuestion = questions[0]
        setQuestion()
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
        self.present(alert, animated: true) {
            self.updateProgressLabel()
        }
    }
    
    
    
    func showPerformanceAlertWithImage2(){
        
        
        let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        //imageView.image = UIImage(systemName: "crown.fill")

        
        var message = "Try Again"
        if((noCorrect/questions.count)*100 >= 90)
        {
            message = "Good job"
            imageView.image = UIImage(systemName: "crown.fill")
        }
        //let alert = UIAlertController(title: message, message: "Score: \(noCorrect)/\(questions.count)", preferredStyle: .alert)
        let alert = UIAlertController(title: message, message: "Score: \(25)/\(25)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Completed", style: .default, handler: nil)
        
        alert.addAction(action)
        alert.view.addSubview(imageView)
        
        
        
        //self.present(alert, animated: true, completion: nil)
        self.present(alert, animated: true) {
            //self.updateProgressLabelCompleted()
        }
    }
    
    func showPerformanceAlertWithImage(){
        
        
        let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        //imageView.image = UIImage(systemName: "crown.fill")

        
        var message = "Try Again"
        if((noCorrect/questions.count)*100 >= 90)
        {
            message = "Good job"
            imageView.image = UIImage(systemName: "crown.fill")
        }
        let alert = UIAlertController(title: message, message: "Score: \(noCorrect)/\(questions.count)", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Completed", style: .default, handler: nil)
        
        alert.addAction(action)
        alert.view.addSubview(imageView)
        
        
        
        //self.present(alert, animated: true, completion: nil)
        self.present(alert, animated: true) {
            self.updateProgressLabel()
        }
    }
    
    func showDetailAlert(detail:String, choice: String){
        
        let alert = UIAlertController(title: choice, message: detail, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        //self.present(alert, animated: true, completion: nil)
        
        // height constraint
           let constraintHeight = NSLayoutConstraint(
              item: alert.view!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
              NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
           alert.view.addConstraint(constraintHeight)

           // width constraint
           let constraintWidth = NSLayoutConstraint(
              item: alert.view!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
              NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
           alert.view.addConstraint(constraintWidth)
        
        
        self.present(alert, animated: true) {
            self.updateProgressLabel()
        }
    }
    func displayQuiz(firstName: String, lastName: String)
    {
        //firstNameLabel.text  = firstName
        //secondNameLabel.text = lastName
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
