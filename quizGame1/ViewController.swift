//
//  ViewController.swift
//  quizGame1
//
//  Created by JOHN DATTILO on 9/14/15.
//  Copyright (c) 2015 JohnHerseyHighSchool. All rights reserved.
//
//
import UIKit
import AVFoundation
import CoreData

struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
    
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var highScoreLbl: UILabel!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet weak var QLabel: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var theEnd: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var counter = 1
    
    var scoreLbl = UILabel()
    
    var score = Int()
    
    var Questions = [Question]()
    
    var QNumber = Int()
    
    var AnswerNumber = Int()
    
    var wrongAnswers = Int()
    
    var highScore = 0
    
    var finalScore = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetQuestions()
        highScoreLbl.text = NSUserDefaults.standardUserDefaults().stringForKey("name")

        
        scoreLbl = UILabel(frame: CGRectMake(35, 45, 77, 45))
        scoreLbl.textAlignment = NSTextAlignment.Center
        scoreLbl.text = "-1"
        self.view.addSubview(scoreLbl)
        
        PickQuestions()
        
        saveHighScore()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetQuestions()
    {
        Questions = [Question(Question: "What is the Biggest Hit of Bing Crosby?" , Answers: ["Swinging on a Star", "Now is the Hour", "White Christmas", "Beautiful Dreamer"], Answer: 2),
            Question(Question: "What is Elvis Presely's Middle Name?", Answers: ["Aaron", "Micheal", "George", "Matthew"], Answer: 0),
            Question(Question: "How Many Oscars did Titanic win?", Answers: ["5", "7", "10", "11"], Answer: 3),
            Question(Question: "From which country did Pitta Bread originate?", Answers: ["Spain", "France", "Greece", "Russia"], Answer: 2),
            Question(Question: "What is the largest living creature on Earth?", Answers: ["Whale", "Shark", "Sea Turtle", "Alligator"], Answer: 0),
            Question(Question: "What does ATM stand for?", Answers: ["Automatic Treasure Machine", "Automatic Tax Machine", "Anti Tax Machine", "Automatic Teller Machine"], Answer: 3),
            Question(Question: "What's the world's second largest French speaking city?", Answers: ["Paris", "Montreal", "Versailles", "Québec"], Answer: 1),
            Question(Question: "What Country is the largest producer of Olive Oil?", Answers: ["Italy", "France", "Greece", "Spain"], Answer: 3),
            Question(Question: "How long is the Great Wall of China?", Answers: ["3200 miles", "4000 miles", "2000 kilometers", "4500 miles"], Answer: 1),
            Question(Question: "Who is on the 10 dollar bill?", Answers: ["George Washington", "Thomas Jefferson", "Alexander Hamilton", "John Adams" ], Answer: 2),
            Question(Question: "How many World Series did Yogi Berra win as a player?", Answers: ["11", "10", "5", "7" ], Answer: 1),
            Question(Question: "Which three countries hosted the Winter Olympics during the 1990's?", Answers: ["Norway, France, Russia", "US, Sweeden, Canada", "Japan, Canada, Germany", "Slovenia, France, South Korea" ], Answer: 0),
            Question(Question: "Which of these foods is high in Vitamin C?", Answers: ["Carrot", "Potato", "Corn", "Tomato" ], Answer: 3),
            Question(Question: "How did John D. Rockefeller make his fortune?", Answers: ["Steel Industry", "Car Industry", "Oil Industry", "RailRoads" ], Answer: 2),
            Question(Question: "Who won the NBA Finals in 2014-2015?", Answers: ["Golden State Warriors", "Clevland Cavaliers", "Chicago Bulls", "Miami Heat" ], Answer: 3),
            Question(Question: "How many branches of government are there in the US?", Answers: ["2", "1", "3", "4" ], Answer: 2),
            Question(Question: "What were two common foods eaten by Americans during the Great Depression?", Answers: ["Soup and Bread", "Beans and Bread", "Potatos and Soup", "Bread and Potatos" ], Answer: 1),
            Question(Question: "Where are the Aleutian Islands?", Answers: ["Alaska, USA", "Northwest Territory, Canada", "Siberia, Russia", "Hawaii"], Answer: 1),
            Question(Question: "?", Answers: ["Barcelona", "Madrid", "Almeria", "Rome" ], Answer: 1),
            Question(Question: "Which of the following NBA players below was drafted first overall?", Answers: ["Micheal Jordan", "Stephen Curry", "Kevin Durant", "Lebron James"], Answer: 3),
            Question(Question: "Which continent has the fewest freshwater lakes?", Answers: ["South America", "Antarctica", "Africa", "Australia"], Answer: 3),
            Question(Question: "Name the 2015 NCAA Men's Basketball Chemionship Matchup?", Answers: ["Duke vs. Kentucky", "Wisconsin vs. Kentucky", "Duke vs. Wisconsin", "Duke vs. Kansas" ], Answer: 2),
            Question(Question: "The salt mines in Salzburg are located in which country?", Answers: ["Lichtenstein", "Germany", "Switzerland", "Austria" ], Answer: 3),
            Question(Question: "What is the furthest city south in Louisiana called?", Answers: ["Venice", "New Orleans", "Baton Rouge", "Slidell" ], Answer: 3),
            Question(Question: "Who was the only president to preside over a debt free government?", Answers: ["Andrew Jackson", "Abraham Linclon", "George Washington", "Theodore Roosevelt" ], Answer: 0),
            Question(Question: "Which of the following countries have not seceded from the Soviet Union?", Answers: ["Kyrgyzstan", "Kazakhstan", "Afganistan", "Uzbekistan" ], Answer: 2),
            Question(Question: "In the game of Monopoly how much is the property Mediterranean Avenue rent?", Answers: ["4", "2", "1", "3" ], Answer: 1),
            Question(Question: "In the NFL 07-08 season which team went 0-16?", Answers: ["Cleveland Browns", "Tampa Bay Buccaneers", "Detroit Lions", "Indianapolis Colts" ], Answer: 2),
            Question(Question: "Which president developed the 'Do Nothing' policy?", Answers: ["Washington", "Taft", "Lincoln", "Obama" ], Answer: 1),
            Question(Question: "Which is the only NFL tam to lose 5 Super Bowls?", Answers: ["Denver", "Miami", "Buffalo", "Minnesota" ], Answer: 0),
            Question(Question: "How many yards did Bo Jackson run?", Answers: ["5000", "12000", "15000", "None of the Above" ], Answer: 1),
            Question(Question: "Who is the Centerfielder for the LA Angels in the 14-15 season?", Answers: ["Kole Calhoun", "Albert Pujols", "Mike Trout", "Cole Blumenthal" ], Answer: 2),
            Question(Question: "Where did Micheal Jordan grow up?", Answers: ["Michigan", "Missouri", "Ohio", "Hawaii" ], Answer: 2),
            Question(Question: "What year was Volkswagon introduced?", Answers: ["1942", "1936", "1945", "1962" ], Answer: 1),
            Question(Question: "Who has won the most Super Bowls in the last 10 years?", Answers: ["New England Patriots", "Seattle Seahawks", "Pittsburgh Steelers", "Denver Broncos" ], Answer: 0),
            Question(Question: "What year did America win the Revolutionary War?", Answers: ["1775", "1865", "1783", "1776" ], Answer: 2),
            Question(Question: "What battle did American win to convince France to help?", Answers: ["Battle of Bunker Hill", "Lexington and Concord", "Battle of Saratoga", "Battle of Trenton" ], Answer: 2),
            Question(Question: "What was NOT a mission from NASA?", Answers: ["Apollo 11", "Apollo 13", "Sputnik 1", "Luna 6" ], Answer: 2),
            Question(Question: "How many colors are in the color spectrum?", Answers: ["6", "5", "8", "7" ], Answer: 3),
            Question(Question: "How hot is the mantle of the Earth?", Answers: ["1800 Degrees", "2000 Degrees", "1500 Degrees", "1200 Degrees" ], Answer: 3),
            Question(Question: "Which of these actors has won an Oscar?", Answers: ["Amy Adams", "Leonardo Dicaprio", "Brad Pitt", "Jennifer Lawrence" ], Answer: 3),
            Question(Question: "Which type of projection of maps were used during the Cold War?", Answers: ["Peters' Projection", "Mercator's Projection", "Robinson's Projection", "Azimuthal Projection" ], Answer: 3),
            Question(Question: "Which type of cell has a nucleus?" , Answers: ["Eukaryotic", "Prokaryotic", "DNA", "Ribosomes"], Answer: 0),
            Question(Question:  "Name the order of Mitosis?" , Answers: ["Prophase,metaphase,anaphase,telophase", "Metaphase,prophase,anaphase,telophase", "Telophase,prophase,metaphase,anaphase", "Telophase,anaphase,metaphase,prophase"], Answer: 0),
            Question(Question:  " What does the nucleolus hold?" , Answers: ["ribosomes", "Cytoplasm", "ER", "DNA"], Answer: 3),
            Question(Question:  "How many elements are on the Periodic Table of Elements?" , Answers: ["114 Element", "135 Elements", "118 Element", "120 Elements"], Answer: 2),
            Question(Question:  "What type of charge does a neutron have?" , Answers:["Positive", "Negative", "No charge", "Neutrons don't exist"] , Answer: 2),
            Question(Question:  "How many atoms are in an element?" , Answers: ["1", "2", "3", "4"], Answer: 0),
            Question(Question:  "What is the atomic number?" , Answers: ["Number of neutrons in the nucleus", "Number of protons in the nucleus", "Number of electrons", "Number of ions"], Answer: 1),
            Question(Question:  "What are the three sizes of carbohydrates?" , Answers: ["Monosaccharides, disaccharides, polysaccharides", "Disaccharides, polysaccharides, trisaccharides", "Monosaccharides, disaccharides, omnisaccharides", "Polysaccharides,monosaccharides,quadrasaccharides"], Answer: 0),
            Question(Question:  " What are the two types of nucleic acids?" , Answers: ["RNA and DNA", "DNA and Glucose", "RNA and Fats", "DNA and Fructose"], Answer: 0),
            Question(Question:  " What does iPS Mean?" , Answers: ["Induced Popular Stem Cells", "Indicated Pluripotent Stem Cells", "Induced Pluripotent Stem Cells", "Induced Pluripotent Skills"], Answer: 2),
            Question(Question:  " What was Lamark’s Theory?" , Answers: ["Inheritance of Acquired characteristics", "Natural Selection", "Gradualism", "Punctuated Equilibrium"], Answer: 0),
            Question(Question:  "What does a ribosome do?" , Answers: ["Makes Proteins", "Holds DNA", "Transports Water", "Holds Waste"], Answer: 0),
            Question(Question:  " When does the nucleus disappear?" , Answers: ["Telophase", "Anaphase", "Metaphase", "Prophase"], Answer: 3),
            Question(Question:  " What is the 'best' tumor to have?" , Answers: ["Both B+C", "Malignant", "Benign", "None of the above"], Answer: 2),
            Question(Question:  " What is the most common cancer treatment?" , Answers: ["Radiation", "Chemotherapy", "Immunotherapy", "Surgery"], Answer: 1),
            Question(Question:  " What is an Isomer?" , Answers: ["Same molecular formula, different chemical structure", "Different molecular formula, same chemical", "Same as a molecule", "None of the above"], Answer: 0),
            Question(Question:  "What is the smallest unit of life?" , Answers: ["Cell", "Atom", "Virus", "A + B"], Answer: 0),
            Question(Question:  " Which characteristics are true of polar molecules?" , Answers: ["Cell Wall", "Plastids", "Large Vacuoles", "All of the above"], Answer: 3),
            Question(Question:  " Movement of cell against concentration gradient is called?" , Answers: ["Osmosis", "Active transport", "Diffusion", "Passive transport"], Answer: 1),
            
            
            
            
        ]
       
        
    }
    
    func PickQuestions(){
        
        counter++
        score++
        scoreLbl.text = "\(score)"
        
        
        
        restartBtn.enabled = false
        if Questions.count > 0 && counter <= 15 {
            QNumber = random() % Questions.count
            QLabel.text = Questions[QNumber].Question
            
            AnswerNumber = Questions[QNumber].Answer
            
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(Questions[QNumber].Answers[i], forState: UIControlState.Normal)
            }
            Questions.removeAtIndex(QNumber)
        }
            
            
        else{
            saveHighScore()
            theEnd.text = "You Win!"
            theEnd.alpha = 1
            button1.enabled = false
            button2.enabled = false
            button3.enabled = false
            button4.enabled = false
            score = finalScore
            restartBtn.enabled = true
            
            func reset(){
                let alert = UIAlertController(title: "You Win", message: "Click Restart To Play Again", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
                PickQuestions()
                
               

            }
            reset()
        }
        
        
        incorrectLabel.alpha = 0
        
    }
    
    func saveHighScore(){
        
        if finalScore >= highScore {
            highScore = finalScore
            highScoreLbl.text = "High Score: " + String(score)
            
            NSUserDefaults.standardUserDefaults().setValue(highScore, forKey: "name")
            
        }
        else{}
        
        
    }
    @IBAction func Btn1(sender: AnyObject) {
        if AnswerNumber == 0{
            PickQuestions()
        }
        else{
            incorrectLabel.text = "You are incorrect!"
            incorrectLabel.alpha = 1
            score--
            scoreLbl.text = "\(score)"
        }
        
    }
    @IBAction func Btn2(sender: AnyObject) {
        if AnswerNumber == 1{
            
            PickQuestions()
        }
        else{
            incorrectLabel.text = "You are Incorrect!"
            incorrectLabel.alpha = 1
            score--
            scoreLbl.text = "\(score)"
        }
    }
    @IBAction func Btn3(sender: AnyObject) {
        if AnswerNumber == 2{
            
            PickQuestions()
        }
        else{
            incorrectLabel.text = "You are Incorrect!"
            incorrectLabel.alpha = 1
            score--
            scoreLbl.text = "\(score)"
        }
    }
    @IBAction func Btn4(sender: AnyObject) {
        if AnswerNumber == 3{
            
            PickQuestions()
        }
        else{
            incorrectLabel.text = "You are Incorrect!"
            incorrectLabel.alpha = 1
            score--
            scoreLbl.text = "\(score)"
        }
    }
}