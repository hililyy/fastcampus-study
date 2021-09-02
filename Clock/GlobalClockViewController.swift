//
//  GlobalClockViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

class GlobalClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var city : [String] = ["서울","가보로네"]
    
    @IBOutlet var cityListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityListView.delegate = self
        cityListView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectCityCell", for: indexPath) as! selectCityCell
        
        //임시 데이터
        cell.lblCityClock.text = "서울"
        cell.lblCityClock.text = "00:00"
        cell.lblNowClock1.text = "오늘,"
        cell.lblNowClock2.text = "+0시간"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93;
    }
    
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
//        if self.cityListView.isEditing {
//            self.editButton.s
//        }
//        cityListView.edit(with: sender, to: UITableView)
//
        
        
    }
    
    func edit(with button: UIBarButtonItem, to tableView: UITableView) {
            if tableView.isEditing {
                button.title = "Edit"
                tableView.setEditing(false, animated: true)
            } else {
                button.title = "Done"
                tableView.setEditing(true, animated: true)
            }
    }
}
