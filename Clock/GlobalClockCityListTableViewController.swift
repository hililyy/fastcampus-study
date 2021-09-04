//
//  GlobalClockCityListTableViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/29.
//

import UIKit

let DidDismissPostCommentViewController: Notification.Name = Notification.Name("DidDismissPostCommentViewController")

class GlobalClockCityListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityListView: UITableView!
    @IBOutlet var search: UISearchBar!
    @IBOutlet var btnCancel: UIButton!
    
//    let searchController =  UISearchController(search)
    
    // 네비게이션 바에 title, search bar, button 넣은건지??? 우선 난 그렇게 안함 ㅠㅠ
    
    let cityItem : [[String]] = [
        ["가보로네, 보츠와나","가자, 팔레스타인"],
        ["나소, 바하마","나우루, 미크로네시아"],
        ["다롄, 중국 본토","다르에스살람, 탄자니아"],
        ["라고스, 나이지리아","라로통가, 쿡 제도"],
        ["마가단, 러시아","마나과, 니카라과"],
        ["바그다드, 이라크","바르샤바, 폴란드"],
        ["사나, 예멘","사라예보, 보스니아 헤르체고비나"],
        ["아과스칼리엔테스, 멕시코","아나디리, 러시아"],
        ["자그레브, 크로아티아","자야푸라, 인도네시아"],
        ["채텀 섬, 뉴질랜드","청두, 중국 본토"],
        ["카나리아 제도, 스페인","카디프, 웨일스"],
        ["타라와, 키리바시","타슈켄트, 우즈베키스탄"],
        ["파고파고, 미국령 사모아","파나마 시티, 파나마"],
        ["하노이, 베트남","하라레, 짐바브웨"]
    ]
    

    let sections: [String] = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
            cityListView.delegate = self
            cityListView.dataSource = self
    }
    
    // 섹션이 몇개인지
    //필수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // 섹션 내부 셀의 각각의 개수
    //필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개?
        return cityItem[section].count
    }
    
    // 필수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇?
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! cityCell
        cell.lblCity.text = cityItem[indexPath.section][indexPath.row]
        
        return cell
    }

    //필수?
    //섹션 타이틀 명
    func tableView(_ tableView:UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(sections[section])
        return sections[section]
    }
    
    // 3. 항목을 선택했을때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("click \(indexPath.row) , \(indexPath.item) , \(indexPath.section)")
        //[indexPath.section][indexPath.row]
        mycity.append(cityItem[indexPath.section][indexPath.row])
        //궁금한게 왜 popViewController로는 이전화면으로 돌아가는게 안될까ㅠㅠ -> modal 이라서??
//        _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
// notification center : 중재자 역할
// 여기서는 tableview의 modal reload를 위해 사용하였다.
        NotificationCenter.default.post(name: DidDismissPostCommentViewController, object: nil, userInfo: nil)

        
    }
    
    @IBAction func cancelClick(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }

}
