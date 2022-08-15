//
//  ResultViewController.swift
//  PsychologicalTest
//
//  Created by Yoga on 2022/8/9.
//

import UIKit

class ResultViewController: UIViewController {
    
    let score : Int
   
    init?(coder: NSCoder, score: Int) {
        self.score = score
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //來自上一頁傳過來的totalscore
        resultScoreLabel.text = "\(score)"
    }
    
    //回到一開始的第一頁
    func restart(){
        navigationController?.popToRootViewController(animated: true)
    }

    
    @IBAction func tryAgain(_ sender: UIButton) {
        
        //UIAlertController
        let controller = UIAlertController(title: "再做一次心理測驗？", message: "確定請按OK！",preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){_ in
            self.restart()
        }
        
        controller.addAction(okAction)
        present(controller, animated: true,completion: nil)
        
        
    }
    

}
