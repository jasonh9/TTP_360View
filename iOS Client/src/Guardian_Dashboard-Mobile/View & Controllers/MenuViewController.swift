//
//  MenuViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/12/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit


protocol AggregateConnectionPriorityDelegate {
    func updateConnectionStatus(withPriorityItems priorityItems: [(item: DashboardItem, value: Float)])
}

class MenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    
    var items: [DashboardItem] = DashboardItem.defaultItems
    var itemPriorityStatuses: [(item: DashboardItem, value: Float)] = [] {
         willSet {
            delegate?.updateConnectionStatus(withPriorityItems: newValue)
        }
    }
    var delegate: AggregateConnectionPriorityDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemPriorityStatuses = items.map { ($0, 0.0) }
        
        menuTableView.tableFooterView = UIView()
    }
    


}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Signal Priority"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.menuCellID, for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.sensorName.text = item.name
        cell.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension MenuViewController: ConnectionPriorityDelegate {
    func updatePriorityStatus(atSensorIndex index: Int, withNewValue updatedValue: Float) {
        itemPriorityStatuses[index].value = updatedValue
        print(itemPriorityStatuses)
    }
}
