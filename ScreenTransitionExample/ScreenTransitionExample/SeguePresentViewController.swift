//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 강조은 on 2021/10/27.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
