//
//  VPNConnectionsViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/3/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class VPNConnectionsViewController: UIViewController {
    
    @IBOutlet weak var vpnTableView: UITableView!
    
    let sensorAggregator = SensorAggregator()
    var currentConnections: [String] = ["Hotspot Shield", "123456"]
    let recentConnections: [String] = ["SuperbVPN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vpnTableView.tableFooterView = UIView()
    }
    
    
    
}

extension VPNConnectionsViewController: UITableViewDataSource, UITableViewDelegate {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.vpnConnectionsCellID, for: indexPath) as? VPNConnectionsTableViewCell else { return UITableViewCell() }
            cell.connectionName.text = currentConnections[indexPath.row]
            cell.securityImage.image = UIImage(named: (indexPath.row+1).isMultiple(of: 2) ? ImageFileNames.encryptionGreen : ImageFileNames.encryptionRed)
            return cell
        }
        guard let recentCell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.vpnRecentConnectionsCellID, for: indexPath) as? VPNRecentConnectionsTableViewCell else { return UITableViewCell() }
        recentCell.recentConnections.text = recentConnections[indexPath.row]
        return recentCell
    }
    
    
}
