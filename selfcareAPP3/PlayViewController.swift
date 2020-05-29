//
//  PlayViewController.swift
//  selfcareAPP3
//
//  Created by 三村文子 on 2020/04/18.
//  Copyright © 2020 三村文子. All rights reserved.
//webKit　調べた　https://qiita.com/MdRk/items/34912e7ba43568f15905
/*
 []viewControllerでcellをタップすると、cellに持っているURLが画面遷移される
 []PlayViewControllerでURLを受け取る
 []動画再生される
 []
 
 */


import UIKit
import WebKit //webViewKitを入れるなら必要

class PlayViewController: UIViewController {
    
    
    var sendtext : String = ""
  
    @IBOutlet weak var play: WKWebView!

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //練習のためにURLを入れてみた。本当は前のViewから画面遷移で持ってきたものを再生させたい
        if let url = NSURL(string: "https:youtu.be/5IG7l9y5Rrc") {
            let request : NSURLRequest = NSURLRequest(url: url as URL)
            play.load(request as URLRequest)
        }
    }
}
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
