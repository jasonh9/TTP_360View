//
//  BTUsersViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/3/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class BTUsersViewController: UIViewController {
    @IBOutlet weak var btUsersTableView: UITableView!
    
    let sensorAggregator = SensorAggregator()
    var newBTLEUsers: [String] = []
    let dummyRecentBTLEUsers: [String] = ["John's iPhone", "Wal-Mart Beacon 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

extension BTUsersViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sensorAggregator.btService.discoveredPeripherals.count
        if section == 0 {
            return newBTLEUsers.count
        } else if section == 1{
            return dummyRecentBTLEUsers.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
