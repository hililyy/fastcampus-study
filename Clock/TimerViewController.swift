//
//  TimerViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

class TimerViewController: UIViewController {
    var interval = 0.1
    
    @IBOutlet var pickerView: UIDatePicker!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var btnStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.addTarget(self, action: #selector(changeDatePicker), for: .valueChanged)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .none
    }
    func changed(){
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
