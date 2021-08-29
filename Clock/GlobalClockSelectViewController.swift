//
//  GlobalClockSelectViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/28.
//

import UIKit

class GlobalClockSelectViewController: UIViewController {
    
    private let cityItem1: [String] = ["가보로네, 보츠와나","가자, 팔레스타인"]
    private let cityItem2: [String] = ["나소, 바하마","나우루, 미크로네시아"]
    private let cityItem3: [String] = ["다롄, 중국 본토","다르에스살람, 탄자니아"]
    private let cityItem4: [String] = ["라고스, 나이지리아","라로통가, 쿡 제도"]
    private let cityItem5: [String] = ["마가단, 러시아","마나과, 니카라과"]
    private let cityItem6: [String] = ["바그다드, 이라크","바르샤바, 폴란드"]
    private let cityItem7: [String] = ["사나, 예멘","사라예보, 보스니아 헤르체고비나"]
    private let cityItem8: [String] = ["아과스칼리엔테스, 멕시코","아나디리, 러시아"]
    private let cityItem9: [String] = ["자그레브, 크로아티아","자야푸라, 인도네시아"]
    private let cityItem10: [String] = ["채텀 섬, 뉴질랜드","청두, 중국 본토"]
    private let cityItem11: [String] = ["카나리아 제도, 스페인","카디프, 웨일스"]
    private let cityItem12: [String] = ["타라와, 키리바시","타슈켄트, 우즈베키스탄"]
    private let cityItem13: [String] = ["파고파고, 미국령 사모아","파나마 시티, 파나마"]
    private let cityItem14: [String] = ["하노이, 베트남","하라레, 짐바브웨"]
    
    private let sections: [String] = ["ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    @IBOutlet var search: UISearchBar!
    @IBOutlet var btnCancel: UIButton!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return sections[section] }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section
        {
        case 0 : return cityItem1.count
        case 1 : return cityItem2.count
        case 2 : return cityItem3.count
        case 3 : return cityItem4.count
        case 4 : return cityItem5.count
        case 5 : return cityItem6.count
        case 6 : return cityItem7.count
        case 7 : return cityItem8.count
        case 8 : return cityItem9.count
        case 9 : return cityItem10.count
        case 10 : return cityItem11.count
        case 11 : return cityItem12.count
        case 12 : return cityItem13.count
        case 13 : return cityItem14.count
        default:
            return 0
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

}
