//
//  ViewController.swift
//  guessNumber
//
//  Created by Bryan Kuo on 2021/9/6.
//
// 猜猜母雞生多少蛋
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessNumberText: UITextField!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var guessTime: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        playAgain.isHidden = true
    
    }
    

    var computerNumber = Int.random(in: 0...50)
    var lowNumber: Int = 0
    var highNumber: Int = 50
    var guessTimes = 6
    
    
    func gameReset() {
        
        lowNumber = 0
        highNumber = 50
        guessTimes = 6
        warning.isHidden = true
        guessNumberText.text = ""
        computerNumber = Int.random(in: 0...50)
        hint.isHidden = false
        hint.text = "數字介於\(lowNumber)~\(highNumber)之間"
        play.isHidden = false
        guessTime.isHidden = false
        playAgain.isHidden = true
        guessTime.text = "還能猜\(guessTimes)次"
    }
    
    
    @IBAction func playGame(_ sender: UIButton) {
        
        guessTimes -= 1
        guessTime.text = "還能猜\(guessTimes)次"
        
        if let guessNumberInt = Int(guessNumberText.text!) {
            
            if guessNumberInt <= 50 {
                
                if guessTimes == 0 {
                    playAgain.isHidden = false
                    play.isHidden = true
                    guessTime.isHidden = true
                    warning.isHidden = false
                    warning.text = " 6次已經用完了，再試試下一次的運氣吧~ "
                    
                }
                
                if guessNumberInt == computerNumber {
                    warning.isHidden = false
                    hint.isHidden = true
                    warning.text = "太棒了，您猜對了！！！"
                    playAgain.isHidden = false
                    play.isHidden = true
                    hint.isHidden = true
                    guessTime.isHidden = true
                    
                } else if guessNumberInt < computerNumber {
                    lowNumber = guessNumberInt
                    hint.text = "數字介於\(lowNumber)~\(highNumber)之間"
                } else if guessNumberInt > computerNumber {
                    highNumber = guessNumberInt
                    hint.text = "數字介於\(lowNumber)~\(highNumber)之間"
                } else {
                warning.isHidden = false
                warning.text = "請輸入數字！！！"
                }

            } else {
                warning.isHidden = false
                warning.text = "請輸入0~50的數字！"
                
            }
            
        }
        
    }
     
    @IBAction func playAgain(_ sender: Any) {
      gameReset()
        
    }
    
}


