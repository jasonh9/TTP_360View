//
//  VPNConnectionsTableViewCell.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/3/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class VPNConnectionsTableViewCell: UITableViewCell {

    @IBOutlet weak var securityImage: UIImageView!
    @IBOutlet weak var connectionName: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
