//
//  StopWatchViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/13.
//

import UIKit

class StopWatchViewController: UIViewController {

   //let timeSelector : Selector = #selector(StopWatchViewController.updateTime)
    let interval = 1.0
    var timeCount = 0
    var mainTimer:Timer?
    var isStart = true
    var isStop = false
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnRight: UIButton!
    @IBOutlet var btnLeft: UIButton!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblDecimal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLeft.isEnabled = false
        btnRight.isEnabled = true
        
        // Do any additional setup after loading the view.
        
    }
    
    func startAction() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (_) in
                    self.timeCount += 1
                    DispatchQueue.main.async {
                       let timeString = self.makeTimeLabel(count: self.timeCount)
                       self.lblTime.text = timeString.0
                       self.lblDecimal.text = ".\(timeString.1)"
                    }
            })
    }
    func makeTimeLabel(count:Int) -> (String,String) {
        //return - (TimeLabel, decimalLabel)
        let decimalSec = count % 10
        let sec = (count / 10) % 60
        let min = (count / 10) / 60
        let sec_string = "\(sec)".count == 1 ? "0\(sec)" : "\(sec)"
        let min_string = "\(min)".count == 1 ? "0\(min)" : "\(min)"
        return ("\(min_string):\(sec_string)","\(decimalSec)")
    }
    
    func stopAction() {
        mainTimer?.invalidate()
        mainTimer = nil
    }
    
    @IBAction func RightTime(_ sender: Any) {
        // 초기 상태에서 시작을 눌렀을 때
        if(isStart){
            startAction()
            btnRight.setTitle("중단", for: .normal)
            btnLeft.setTitle("랩", for: .normal)
            isStop = true
            isStart = false
            btnLeft.isEnabled = true
        }
        // 중단을 눌렀을때
        else if(!isStart){
            stopAction()
            btnRight.setTitle("시작", for: .normal)
            btnLeft.setTitle("재설정", for: .normal)
            isStop = false
            isStart = true
        }
    }
    // 재설정을 눌렀을 때
    @IBAction func LeftTime(_ sender: UIButton) {
        if(isStart){
            btnRight.setTitle("시작", for: .normal)
            btnLeft.setTitle("랩", for: .normal)
            btnLeft.isEnabled = false
            timeCount = 0
            lblTime.text = "00:00"
            lblDecimal.text = ".00"
            
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




