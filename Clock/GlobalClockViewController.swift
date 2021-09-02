//
//  GlobalClockViewController.swift
//  Clock
//
//  Created by 강조은 on 2021/08/26.
//

import UIKit

class GlobalClockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var cityListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityListView.delegate = self
        cityListView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectCityCell", for: IndexPath) as! selectCityCell
        
        cell.lblCityClock = ""
        return cell
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
