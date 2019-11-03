//
//  ViewController.swift
//  Guardian_Dashboard-Mobile
//
//  Created by Andrew Struck-Marcell on 11/1/19.
//  Copyright © 2019 Andrew Struck-Marcell. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet weak var dashboardItemsCollectionView: UICollectionView!
    
    let socketManager = SocketIOManager.shared
    var items: [DashboardItem] = DashboardItem.defaultItems {
        didSet {
            socketManager.sendJSON(with: UIDevice.current.identifierForVendor?.uuidString ?? "",
                                   connectionStatus: "disconnected",
                                   newBTLEUsers: [BTLE(deviceName: "John's iphone", sigStrength: "proximate", btSystem: "BLE"), BTLE(deviceName: "ABCDE", sigStrength: "weak", btSystem: "BLE")])
        }
    }
    var collectionViewWidth: CGFloat { return dashboardItemsCollectionView.bounds.width }
    var collectionViewHeight: CGFloat { return dashboardItemsCollectionView.bounds.height }
    var itemHeight: CGFloat { return collectionViewHeight / 5 }
    
    @IBAction func hiddenChangeButtonTapped(_ sender: UIButton) {
        print("hiddenChangeButtonTapped")
        changeInStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeInStatus() {
        items[0] = DashboardItem(type: .lte(signalStrength: .noSignal))
        socketManager.updateInterval = 300
        dashboardItemsCollectionView.reloadData()
    }


}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardStrings.dashboardItemRestoreID, for: indexPath) as? DashboardItemCollectionViewCell else { return UICollectionViewCell() }
        cell.itemName.text = items[indexPath.item].name
        cell.itemImageView.image = items[indexPath.item].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //BTLE
        if indexPath.item == 1 {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewWidth/4, height: itemHeight)
    }

    
    
}

