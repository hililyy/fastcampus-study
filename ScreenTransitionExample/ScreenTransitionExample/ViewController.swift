//
//  ViewController.swift
//  ScreenTransitionExample
//
//  Created by 강조은 on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tapCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePushViewController") as? CodePushViewController else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.name = "Gunter"
        
    }
    @IBAction func tapCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "CodePresentViewController") as? CodePresentViewController else{ return }
        viewController.modalPresentationStyle = .fullScreen
        viewController.name = "Gunter"
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SeguePushViewController {
            viewController.name = "Gunter"
        }
    } // 세그웨이 호출 전 자동으로 호출됨
    
    func sendData(name:String){
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}

