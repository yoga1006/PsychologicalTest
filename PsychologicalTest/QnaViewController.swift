//
//  QnaViewController.swift
//  PsychologicalTest
//
//  Created by Yoga on 2022/8/9.
//

import UIKit

class QnaViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerBtn: [UIButton]!
    
    var questions = [Qna]()
    var questionIndex = 0
    var totalscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let question1 = Qna(description: "1.當你心情愉快時，你會想吃哪一種水果？", option: ["芭樂 +0","蘋果 +5","草莓 +10"])
        questions.append(question1)
        let question2 = Qna(description: "2.當你感覺很優閒舒適時，你會用哪一種顏色來形容？", option: ["白色 +0","綠色 +5","藍色 +10"])
        questions.append(question2)
        let question3 = Qna(description: "3.當你想到咖啡廳喝杯咖啡時，會希望戶外是哪一種天氣狀態？", option: ["雨天 +0","陰天 +5","晴天 +10"])
        questions.append(question3)
        let question4 = Qna(description: "4.當你想打發時間，會選擇哪一種方式？", option: ["看書或聽音樂 +0","看電視或打電話聊天 +5","睡覺或到戶外走走 +10"])
        questions.append(question4)
       
        startGame()
        
    }
    

    func startGame(){
        
        if questionIndex < 4{
        questionLabel.text = questions[questionIndex].description
        //填入選項內容
        for i in 0...2{
            answerBtn[i].setTitle(questions[questionIndex].option[i], for: .normal)
        }
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        questionIndex += 1
        startGame()
        
        //先將btn都設定好tag，其tag就是各自選項代表的分數
        if questionIndex < 5 {
            totalscore += sender.tag
        }
        
        //判斷是否還有題目
        //當題目數為四題時，傳遞資料
        if questionIndex == 4 {
        performSegue(withIdentifier: "show", sender: nil)
        }
        
        
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder,score:totalscore)
    }
    
    
}
