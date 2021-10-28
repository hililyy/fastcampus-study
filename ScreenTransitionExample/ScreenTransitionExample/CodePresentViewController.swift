//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 강조은 on 2021/10/27.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}
class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate? // delegate앞에는 weak로! -> 안할경우 메모리 누수 위험 넘 높아
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // 텍스트 사이즈 안짤리게
        }
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Gunter")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
