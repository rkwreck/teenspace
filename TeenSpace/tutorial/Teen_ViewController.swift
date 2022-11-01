//
//  Teen_ViewController.swift
//  tutorial
//
//  Created by Rini Khandelwal on 10/14/22.
//

import UIKit

class Teen_ViewController: UIViewController {

    let questions = datingQuestions.shuffled()
    var currentQuestion: Question?
    
    var currentQuestionPos = 0
    var noCorrect = 0
    var answerButton: UIButton?
    var correctPicked = false
    var randomNum = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    
    @IBOutlet weak var lblProgress: UILabel!
    
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
        //lblProgress.text = "\(currentQuestionPos+1) / \(12)"
        lblProgress.text = "\(currentQuestionPos+1) / \(questions.count)"
    }
    func resetStats()
    {
        currentQuestionPos = 0
        noCorrect = 0
        //progressBar.progress = 0.0
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1)
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
    }
    
    func updateProgress()
    {
        //progressBar.progress += 0.1 //Float(currentQuestionPos/drivingQuestions.count)

        //progressBar.setProgress(progressBar.progress, animated: true)
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
        
        /*answer0.tintColor = UIColor.blue
        answer1.tintColor = UIColor.blue
        answer2.tintColor = UIColor.blue
        answer3.tintColor = UIColor.blue*/
        
        answer0.tintColor = UIColor.black
        answer1.tintColor = UIColor.black
        answer2.tintColor = UIColor.black
        answer3.tintColor = UIColor.black
        
        
        answer0.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer1.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer2.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer3.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        
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
    
    func reset()
    {
        //progressBar.progress = 0.0
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
        updateProgressLabel()
        currentQuestion = questions[0]
        setQuestion()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reset()
    }
    
    
    
    
    
   /* let questions = datingQuestions
    var currentQuestion: Question?
    
    var currentQuestionPos = 0
    var noCorrect = 0
    var answerButton: UIButton?
    var correctPicked = false
    var randomNum = 0
    var score = 0
    var lastScore = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answer0: UIButton!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var lblQuestion: UITextView!
    
    @IBOutlet weak var lblProgress: UILabel!
    
    @IBAction func option1(_ sender: UIButton) {
        lastScore = 4
        //score += 4
        answerButton = answer0
        checkAnswer(updateScore: 4)
    }
    @IBAction func option2(_ sender: UIButton) {
        lastScore = 3
        //score += 3
        answerButton = answer1
        checkAnswer(updateScore: 3)
    }
    
    @IBAction func option3(_ sender: UIButton) {
        lastScore = 2
        //score += 2
        answerButton = answer2
        checkAnswer(updateScore: 2)
    }
    
    @IBAction func option4(_ sender: UIButton) {
        lastScore = 1
        //score += 1
        answerButton = answer3
        checkAnswer(updateScore: 1)
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        loadNextQuestion()
    }
    
    func updateProgressLabel()
    {
        lblProgress.text = "\(currentQuestionPos+1) / \(questions.count)"
    }
    func resetStats()
    {
        currentQuestionPos = 0
        noCorrect = 0
        //progressBar.progress = 0.0
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1)
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
    }
    
    func updateProgress()
    {
        //progressBar.progress += 0.1 //Float(currentQuestionPos/drivingQuestions.count)

        //progressBar.setProgress(progressBar.progress, animated: true)
    }
    func checkAnswer(updateScore:Int)
    {
        answerButton!.backgroundColor = UIColor.blue
        
        // if changing choice
        if(correctPicked)
        {
            score -= lastScore
        }
        else
        {
            updateProgressLabel()
        }
        score += updateScore
        correctPicked = true
        //var choice = "Correct"
        
        
        answerButton!.backgroundColor = UIColor.blue
        //lblProgress.text = "\(noCorrect) / \(questions.count)"
        //loadNextQuestion()
    }
    
    func loadNextQuestion()
    {
        correctPicked = false
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
        
        answer0.tintColor = UIColor.black
        answer1.tintColor = UIColor.black
        answer2.tintColor = UIColor.black
        answer3.tintColor = UIColor.black
        
        /*answer0.backgroundColor = UIColor.systemPink
        answer1.backgroundColor = UIColor.systemPink
        answer2.backgroundColor = UIColor.systemPink
        answer3.backgroundColor = UIColor.systemPink*/
        
        answer0.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer1.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer2.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        answer3.backgroundColor = UIColor.init(displayP3Red: 0.98, green: 0.71, blue: 0.76, alpha: 1)
        
        
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
    
    func reset()
    {
        //progressBar.progress = 0.0
        //progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 0.2)
        updateProgressLabel()
        currentQuestion = questions[0]
        setQuestion()
    }
    
    func showPerformanceAlertWithImage(){
        
        
        let imageView = UIImageView(frame: CGRect(x: 220, y: 10, width: 40, height: 40))
        //imageView.image = UIImage(systemName: "crown.fill")

        let message4 = "You appear to be in a very unhealthy relationship and may be in danger. Please ask for help immediately"
        
        let message3 = "It appears that you may be experiencing some of the warning signs of an abusive relationship. Don’t ignore these signs, because abuse tends to become worse of over time. Ask for help, because nobody deserves to be abused."
        
        let message2 = "No relationship is perfect, but it sounds like yours may need a little work. Healthy relationships are built upon mutual respect and trust. Sharing your concerns with your dating partner is a great way to start."
        
        let message1 = "It sounds like you have a very healthy relationship! Remember, even the best relationships take work to keep them healthy and successful."
       
        let message: String
        if(score <= 15)
        {
            message = message1
        }
        else if (score > 15 && score <= 20 )
        {
            message = message2
        }
        else if( score > 20 && score <= 30)
        {
            message = message3
        }
        else
        {
            message = message4
        }
        
        let alert = UIAlertController(title: "Your Relationship Score \(score)", message: message, preferredStyle: .alert)
        
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

        // Do any additional setup after loading the view.
        reset()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
}
