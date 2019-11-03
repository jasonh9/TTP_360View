//
//  WiFiConnectionsViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/3/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class WiFiConnectionsViewController: UIViewController {

    @IBOutlet weak var wifiTableView: UITableView!
        let sensorAggregator = SensorAggregator()
        var currentConnections: [String] = ["ProtonSecure"]
        let recentConnections: [String] = ["Comcast93285723947-5gHz", "Starbucks"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            wifiTableView.tableFooterView = UIView()
        }
        
        
        
    }

    extension WiFiConnectionsViewController: UITableViewDataSource, UITableViewDelegate {
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
                return currentConnections.count
            }
            return recentConnections.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return tableView.frame.height/10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.wifiConnectionsCellID, for: indexPath) as? WifiConnectionsTableViewCell else { return UITableViewCell() }
                cell.connectionName.text = currentConnections[indexPath.row]
                cell.securityImage.image = UIImage(named: !(indexPath.row+1).isMultiple(of: 2) ? ImageFileNames.encryptionGreen : ImageFileNames.encryptionRed)
                return cell
            }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.wifiRecentConnectionsCellID, for: indexPath) as? WiFiRecentConnectionsTableViewCell else { return UITableViewCell() }
            cell.connectionName.text = recentConnections[indexPath.row]
            return cell
        }
        
        
    }
