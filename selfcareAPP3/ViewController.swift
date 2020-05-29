//
//  ViewController.swift
//  selfcareAPP3
//
//  Created by 三村文子 on 2020/04/18.
//  Copyright © 2020 三村文子. All rights reserved.
//https://qiita.com/sl2/items/6c3241577f0f72850f97


import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    //動画リスト
//    この入力の仕方　Dictionary配列
//  https://www.youtube.com/watch?v=IJIJawKJTLc
    let list = [["name":"肩こり解消１", "url":"https://youtu.be/5IG7l9y5Rrc"], ["name":"肩こり解消２", "url":"https://youtu.be/n9s1Kz4RqZ0"],  ["name":"肩こり解消３" , "url": "https://youtu.be/tcgmukjs0LA"] , ["name":"肩こり解消４", "url":"https://youtu.be/YpjG1QYHG24"] ,  ["name":"肩こり解消５", "url" :"https://youtu.be/d17UrmbL0jA "] , ["name": "腰痛解消１", "url":"https://youtu.be/Q9rI7Ta6B2Q"]  ,  [ "name":"腰痛解消２","url": "https://youtu.be/HqcoqvP8uKw" ], ["name": "腰痛解消３", "url":"https://youtu.be/DFf90ITpl6I"] , ["name": "腰痛解消４", "url":"https://youtu.be/m7CtjRFE13g"] , ["name": "腰痛解消５", "url":"https://youtu.be/MlqRBd0UMPE"]]
    
    //listをまとめてみた 4/20 ⭐️
    //    let list = [["name":"肩こり解消１", "url":"https://youtu.be/5IG7l9y5Rrc"], ["name":"肩こり解消２", "url":"https://youtu.be/n9s1Kz4RqZ0"],  ["name":"肩こり解消３" , "url": "https://youtu.be/tcgmukjs0LA"] , ["name":"肩こり解消４", "url":"https://youtu.be/YpjG1QYHG24"] ,  ["name":"肩こり解消５", "url" :"https://youtu.be/d17UrmbL0jA "]]
    //
    //    let koshiList = [["name": "腰痛解消１", "url":"https://youtu.be/Q9rI7Ta6B2Q"]  ,  [ "name":"腰痛解消２","url": "https://youtu.be/HqcoqvP8uKw" ], ["name": "腰痛解消３", "url":"https://youtu.be/DFf90ITpl6I"] , ["name": "腰痛解消４", "url":"https://youtu.be/m7CtjRFE13g"] , ["name": "腰痛解消５", "url":"https://youtu.be/MlqRBd0UMPE"]]
    
    //sectionを何個表示するか
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //何行表示するか　listに登録した数だけ
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    //cellのtitleを変える
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) //as! PlayViewController
        
        
        //textに入れたいもの、自分のlistのindexPathのアイテムを取得
        let item = self.list[indexPath.row]
        //cellのtextLabelを表示
        cell.textLabel?.text = item["name"]
        
//      if cell.gestureRecognizer?.count == 5 {
            //gestureを設定
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector(("name:")))
            cell.addGestureRecognizer(tapGesture)
        cell.isUserInteractionEnabled = true
        
        
        return cell
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var search: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //必ず入れないといけないコード
        self.myTableView .dataSource = self
        self.myTableView .delegate = self
    }
    //行をタップされた時の処理を書く。次の画面にプッシュされるようにする
    //⭐️4/20　sender:itemをnilに変更
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.list[indexPath.row]
        self.performSegue(withIdentifier: "toPlay", sender: nil)
        
    }
    
    //パラメーターでどのSegueが押されたかを設定する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlay" {
            //次の画面のViewControllerを取得
            let playViewController: PlayViewController = segue.destination as! PlayViewController
            //上のsenderにitemのstringをの値を入れなさいという命令
            //next.の後ろはPlayVCに書かれているラベルの名前を書く?
            
//            let item = self.list[indexPath.row]
//            playViewController.sendtext = item["name"]
            
        }
    }
}


