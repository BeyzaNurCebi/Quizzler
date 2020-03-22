

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
   
    @IBOutlet weak var choice_1: UIButton!
    
    @IBOutlet weak var choice_2: UIButton!
    
    @IBOutlet weak var choice_3: UIButton!
    
    var quizBrain = QuizBrain()
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer=sender.currentTitle! //True or False
       
        
        let userGotItRight=quizBrain.checkAnswer(userAnswer: userAnswer)
        
     
        
        if userGotItRight{
            sender.backgroundColor=UIColor.green
           

        }else{
            sender.backgroundColor=UIColor.red
            
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text=quizBrain.getQuestionText()
        
        let answerChoices=quizBrain.getAnswers()
        choice_1.setTitle(answerChoices[0], for: .normal)
        choice_2.setTitle(answerChoices[1], for: .normal)
        choice_3.setTitle(answerChoices[2], for: .normal)
        
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text="Score: \(quizBrain.getScore())"
        choice_1.backgroundColor=UIColor.clear
        choice_2.backgroundColor=UIColor.clear
        choice_3.backgroundColor=UIColor.clear
        

        

    }
    
    
    
}


