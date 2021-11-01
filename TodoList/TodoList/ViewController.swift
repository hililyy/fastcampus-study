//
//  ViewController.swift
//  TodoList
//
//  Created by 강조은 on 2021/11/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: nil, preferredStyle: .alert) // actionsheet : 아래에서 올라오는 것
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: {_ in
            deb
        }) // 핸들러 파라미터에는 클로저를 정의, Alert를 눌렀을때 실행해야하는 행동을 정의
        alert.textFields?[0].text
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)//핸들러 별다른 액션 없어
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "할 일을 입력해주세요."})
        self.present(alert, animated: true, completion: nil)
    }
}

