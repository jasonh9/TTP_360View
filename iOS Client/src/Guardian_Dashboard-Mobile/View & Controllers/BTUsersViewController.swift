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
    
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func viewSwiped(_ sender: UISwipeGestureRecognizer) {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btUsersTableView.tableFooterView = UIView()
    }

}

extension BTUsersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let location = touch.location(in: btUsersTableView)
        let touchIsInTableView = location.x >= 0.0 && location.y >= 0.0 && location.x <= btUsersTableView.frame.width && location.y <= btUsersTableView.frame.height
        return !touchIsInTableView
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
