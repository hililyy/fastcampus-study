//
//  TimerViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

class TimerViewController: UIViewController{
   
    
    var interval = 0.1
    
    @IBOutlet var pickerView: UIDatePicker!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnStart: UIButton!
    @IBOutlet var btnSound: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
   
        btnSound.layer.cornerRadius = 10
        btnSound.backgroundColor = UIColor.gray
        btnSound.setTitleColor(.white, for: .normal)
        

        
        
//        pickerView.addTarget(self, action: #selector(changeDatePicker), for: .valueChanged)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
       // let datePickerView = sender
//        let dateformatter = DateFormatter()
//
//        dateformatter.dateStyle = .none
//        dateformatter.timeStyle = .none
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "timerSingleCell", for: indexPath) as! timerSingleCell
//        cell.lbltext.text = "타이머 종료 시"
//        cell.selectSound.text = "전파탐지기"
//        return cell
//    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "soundSegue", sender: self)
//    }

}
