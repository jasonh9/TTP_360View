//
//  NFCTransmissionsViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/3/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class NFCTransmissionsViewController: UIViewController {
    
    @IBOutlet weak var nfcTableView: UITableView!
    
    let sensorAggregator = SensorAggregator()
    let currentTransmissions: [String] = ["mifare"]
    let recentTransmissions: [String] = ["ndef"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nfcTableView.tableFooterView = UIView()
    }
    
    
    
}

extension NFCTransmissionsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Current Transmissions"
        }
        return "Recent Transmissions"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return sensorAggregator.btService.discoveredPeripherals.count
        if section == 0 {
            return currentTransmissions.count
        }
        return recentTransmissions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.nfcTransmissionCellID, for: indexPath) as? NFCTransmissionsTableViewCell else {
            return UITableViewCell() }
        let dataSource: [String] = indexPath.section == 0 ? currentTransmissions : recentTransmissions
        cell.transmissionLabel.text = dataSource[indexPath.row]
        return cell
    }
    
    
}
