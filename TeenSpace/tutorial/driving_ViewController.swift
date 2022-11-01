//
//  driving_ViewController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/12/22.
//

import UIKit

class driving_ViewController: UIViewController {

    let questions = drivingQuestions.shuffled()
    var totalQ = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    var currentQuestion: Question?
    
    var currentQuestionPos = 0
    var noCorrect = 0
    var answerButton: UIButton?
    var correctPicked = false
    var randomNum = 0
    
    
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
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
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        loadNextQuestion()
    }
    
    
    func updateProgressLabel()
    {
        //lblProgress.text = "\(currentQuestionPos+1) / \(20)"
        lblProgress.text = "\(currentQuestionPos+1) / \(questions.count)"
    }
    func resetStats()
    {
        currentQuestionPos = 0
        noCorrect = 0
        //progressBar.progress = 0.0
        totalQ = 0
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1)
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
    }
    
    func updateProgress()
    {
        //var step = 0.1
        //step = Float(1/(Float(drivingQuestions.count))
        //progressBar.progress += 0.1
        
        /*
        progressBar.progress = Float(currentQuestionPos+1)/Float(questions.count)

        progressBar.setProgress(progressBar.progress, animated: true)
         */
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
            //answerButton!.tintColor = UIColor.green
            answerButton!.backgroundColor = UIColor.green
            correctPicked = true
        }
        else
        {
            choice = "Wrong"
            //answerButton!.tintColor = UIColor.red
            answerButton!.backgroundColor = UIColor.red
        }
        showDetailAlert(detail:questions[currentQuestionPos].detail,choice:choice)
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
            
            //showPerformanceAlert()
            showPerformanceAlertWithImage()
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
        
        /*
        answer0.tintColor = UIColor.blue
        answer1.tintColor = UIColor.blue
        answer2.tintColor = UIColor.blue
        answer3.tintColor = UIColor.blue
         */
        
        answer0.tintColor = UIColor.black
        answer1.tintColor = UIColor.black
        answer2.tintColor = UIColor.black
        answer3.tintColor = UIColor.black
        
        
        answer0.backgroundColor = UIColor.init(displayP3Red: 0.886, green: 0.804, blue: 0.969, alpha: 1)
        answer1.backgroundColor = UIColor.init(displayP3Red: 0.886, green: 0.804, blue: 0.969, alpha: 1)
        answer2.backgroundColor = UIColor.init(displayP3Red: 0.886, green: 0.804, blue: 0.969, alpha: 1)
        answer3.backgroundColor = UIColor.init(displayP3Red: 0.886, green: 0.804, blue: 0.969, alpha: 1)
        
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
        self.present(alert, animated: true) {
            self.updateProgressLabel()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //progressBar.progress = 0.0
        //progressBar.transform = progressBar.transform.scaledBy(x: 0.8, y: 0.1)
        updateProgressLabel()
        currentQuestion = questions[0]
        setQuestion()

        // Do any additional setup after loading the view.
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
