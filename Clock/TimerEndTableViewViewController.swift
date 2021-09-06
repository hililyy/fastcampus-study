//
//  TimerEndTableViewViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/09/05.
//

import UIKit

class TimerEndTableViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet var timerTableView: UITableView!
    
    var sound = ["전파탐지기(기본 설정)","공상음","공지음","녹차","놀이 시간","느린 상승","도입음","물결","반짝반짝","발산","밤부엉이","별자리","상승음","순환음","신호"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerTableView.delegate = self
        timerTableView.dataSource = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timerEndCell", for: indexPath) as! timerEndCell
        cell.lbltext.text = sound[indexPath.row]
        return cell
    }
    
    
    @IBAction func settingAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
}
