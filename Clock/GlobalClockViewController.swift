//
//  GlobalClockViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

class GlobalClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mycity : [String] = ["서울","가보로네"]
    
    
    @IBOutlet var cityListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네비게이션 왼쪽 버튼 클릭 시 전체 편집이 되어야 하는데 그게 안됨 ㅠㅠ..
        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        self.cityListView.allowsSelectionDuringEditing = true
        cityListView.delegate = self
        cityListView.dataSource = self
        
//        self.navigationItem.leftBarButtonItem.title = "편집";
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cityListView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycity.count
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mycity.remove(at: (indexPath as NSIndexPath).row)
            cityListView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == . insert{
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
   
    
}
