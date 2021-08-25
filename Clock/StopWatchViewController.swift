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
    var tableData = [String]()
    var count = 1
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnRight: UIButton!
    @IBOutlet var btnLeft: UIButton!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblDecimal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLeft.isEnabled = false
        btnRight.isEnabled = true
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    func startAction() {
        mainTimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (_) in
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
        let decimalSec = count % 100 // 나누기 100으로 하는게 맞는듯..
        let sec = (count / 100) % 60
        let min = (count / 100) / 60
        let sec_string = "\(sec)".count == 1 ? "0\(sec)" : "\(sec)"
        let min_string = "\(min)".count == 1 ? "0\(min)" : "\(min)"
        return ("\(min_string):\(sec_string)","\(decimalSec)")
    }
    
    func stopAction() {
        mainTimer?.invalidate()
        mainTimer = nil
    }
    
    @IBAction func RightTime(_ sender: UIButton) {
        // 초기 상태에서 시작을 눌렀을 때
        if(isStart){
            startAction()
            btnRight.setTitle("중단", for: .normal)
            btnLeft.setTitle("랩", for: .normal)
            isStop = true
            isStart = false
            // 중단을 할 수 있는 상태, 시작을 못 하는 상태 (시작을 눌렀기 때문)
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
   
    @IBAction func LeftTime(_ sender: UIButton) {
        // 재설정을 눌렀을 때
        if(isStart){
            btnRight.setTitle("시작", for: .normal)
            btnLeft.setTitle("랩", for: .normal)
            btnLeft.isEnabled = false
            timeCount = 0
            lblTime.text = "00:00"
            lblDecimal.text = ".00"
            self.tableData.removeAll()
            self.tableView.reloadData()
            count = 1
        }
        // 랩을 눌렀을 때
        else if(!isStart) {
            
            let timeString = self.makeTimeLabel(count: self.timeCount)
            self.tableData.append("\(timeString.0).\(timeString.1)")
            let indexPath = IndexPath(row: self.tableData.count - 1, section: 0)
            
            self.tableView.insertRows(at: [indexPath], with: .automatic)
          //  self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
            

        }
        
    }
    
}

extension StopWatchViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StopWatchTableViewCell.cell_id, for: indexPath) as! StopWatchTableViewCell
        
        let item = self.tableData[indexPath.row]
            cell.lblTime.text = item
            cell.lblLabIndex.text = "랩 " + String(count)
            count = count + 1
            return cell

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




