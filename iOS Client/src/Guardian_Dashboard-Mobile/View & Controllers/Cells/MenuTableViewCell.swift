//
//  MenuTableViewCell.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/12/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

protocol ConnectionPriorityDelegate {
    func updatePriorityStatus(atSensorIndex index: Int, withNewValue updatedValue: Float)
}

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var sensorName: UILabel!
    @IBOutlet weak var prioritySlider: UISlider!
    @IBOutlet weak var checkbox: UIButton!
    
    var delegate: ConnectionPriorityDelegate?
    var cellIsEnabled = true
    var checkboxShouldBeChecked = true {
        willSet {
            let image = newValue ? UIImage(systemName: "checkmark", withConfiguration: nil) : nil
            checkbox.setImage(image, for: .normal)
            
            contentView.tintColor = newValue ? nil : GuardianColors.guardianGray
            sensorName.textColor = newValue ? nil : GuardianColors.guardianGray
            prioritySlider.isUserInteractionEnabled = newValue
            
        }
    }
    
    @IBAction func checkboxTapped(_ sender: UIButton) {
        checkboxShouldBeChecked.toggle()
        delegate?.updatePriorityStatus(atSensorIndex: self.tag, withNewValue: checkboxShouldBeChecked ?  prioritySlider.value : 0.0)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider, forEvent event: UIEvent) {
        //TODO: in sending the value here, use self.tag, which == its IndexPath.row
        print("slider in cell with tag: \(self.tag) changed value, is now: \(sender.value)")
        delegate?.updatePriorityStatus(atSensorIndex: self.tag, withNewValue: sender.value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkbox.layer.borderWidth = 2
        checkbox.layer.borderColor = UIColor.lightGray.cgColor
        prioritySlider.isContinuous = false
        
        delegate?.updatePriorityStatus(atSensorIndex: self.tag, withNewValue: checkboxShouldBeChecked ?  prioritySlider.value : 0.0)
    }
}
