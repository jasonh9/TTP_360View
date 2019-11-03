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
    let dummyRecentBTLEUsers: [String] = ["Shelley's Pixel 3", "Wal-Mart Beacon 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btUsersTableView.tableFooterView = UIView()
    }
    


}

extension BTUsersViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Connected Devices"
        }
        return "Recently Connected Devices"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sensorAggregator.btService.discoveredPeripherals.count
        if section == 0 {
            return newBTLEUsers.count
        }
        return dummyRecentBTLEUsers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.btUsersCellID, for: indexPath) as? BTUserTableViewCell else { return UITableViewCell() }
        let dataSource: [String] = indexPath.section == 0 ? newBTLEUsers : dummyRecentBTLEUsers
        cell.btUserName.text = dataSource[indexPath.row]
        return cell
    }
    
    
}
