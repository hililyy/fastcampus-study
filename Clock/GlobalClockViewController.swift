//
//  GlobalClockViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

// 후에 데이터 구조체 형식으로 관리
// 클래스 밖에 전역변수로 사용하면 다른 컨트롤러에서도 접근 가능
// 안된것 : 네비게이션 edit 버튼, search bar

var mycity = ["서울"]

class GlobalClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 네비게이션 왼쪽 버튼 클릭 시 전체 편집이 되어야 하는데 그게 안됨 ㅠㅠ..
        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        self.cityListView.allowsSelectionDuringEditing = true
        cityListView.delegate = self
        cityListView.dataSource = self
        
        
//        self.navigationItem.leftBarButtonItem.title = "편집";
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissPostCommentNotification(_:)), name: DidDismissPostCommentViewController, object: nil)
    }
    //viewWillAppear : 뷰가 노출될 때마다 호출됨
    override func viewWillAppear(_ animated: Bool) {
        cityListView.reloadData()
        // modal은 이런 방식의 reload가 안되는것 같음
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
        cell.lblCityName.text = "서울"
        //   cell.lblCity.text = cityItem[indexPath.section][indexPath.row]
        cell.lblCityName.text = mycity[indexPath.row]
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
    
    @objc func didDismissPostCommentNotification(_ noti: Notification) {
           // requestComments()
          // 이 부분을 해주어야 다시 comment들을 api로 가져올 수 있었다.
          // 즉, reload할 데이터를 불러와야 바뀌는 게 있다는 의미다.
          // 안 해서 고생함...
            OperationQueue.main.addOperation { // DispatchQueue도 가능.
                
                self.cityListView.reloadData()
            }

        }
    
}
