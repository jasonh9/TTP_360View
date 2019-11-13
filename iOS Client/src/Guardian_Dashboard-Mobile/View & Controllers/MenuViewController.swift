//
//  MenuViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/12/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var menuTableView: UITableView!
    
    var items: [DashboardItem] = DashboardItem.defaultItems
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.tableFooterView = UIView()
    }
    


}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardStrings.menuCellID, for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
    
}
