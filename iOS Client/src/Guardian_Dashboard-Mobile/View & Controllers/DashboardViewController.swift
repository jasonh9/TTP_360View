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
    @IBOutlet weak var overallConnectionStatus: UILabel!
    @IBOutlet weak var connectionStatusContainingView: UIView!
    @IBOutlet weak var menuContainerView: UIView!
        
    let sensorAggregator = SensorAggregator()
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
    var itemHeight: CGFloat { return collectionViewHeight / 3.5 }
//    var shownMenuWidth: CGFloat { return view.bounds.width / 1.33 }
    var menuShouldDisplay = false
    
    @IBAction func hiddenChangeButtonTapped(_ sender: UIButton) {
        print("hiddenChangeButtonTapped")
        changeInStatus()
    }
    
    @IBAction func menuTapped(_ sender: UIButton) {
        menuShouldDisplay.toggle()
        menuContainerView.isHidden = !menuShouldDisplay
//        menuWidth.constant = menuShouldDisplay ? shownMenuWidth : 0
    }
    
    
    @IBAction func dismissMenuTap(_ sender: UITapGestureRecognizer) {
        menuShouldDisplay = false
        menuContainerView.isHidden = true
//        menuWidth.constant = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sensorAggregator.delegate = self
        overallConnectionStatus.attributedText = overallConnectionStatusText(forSignalStrength: .medium)
        connectionStatusContainingView.layer.cornerRadius = 10
        view.bringSubviewToFront(menuContainerView)
        
    }
    
    func addChildVC() {
        let menuVC = UIStoryboard(name: StoryboardStrings.mainStoryboardName, bundle: nil).instantiateViewController(identifier: StoryboardStrings.menuStoryboardID) as! MenuViewController
        menuVC.delegate = self
        self.addChild(menuVC)
        //Set delegate, as well as instantiate
    }
    
    
    //MARK: Modal View Presentations
    func presentBTUsersVC() {
        let btUsersVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: StoryboardStrings.btUsersVCID) as! BTUsersViewController
        btUsersVC.modalPresentationStyle = .overCurrentContext
        btUsersVC.newBTLEUsers = ["John's iphone", "ABCDE"]
        present(btUsersVC, animated: false, completion: nil)
    }
    
    func presentNFCTransmissionsVC() {
        let nfcTransmissionsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: StoryboardStrings.nfcTransmissionsVCID) as! NFCTransmissionsViewController
        nfcTransmissionsVC.modalPresentationStyle = .overCurrentContext
        present(nfcTransmissionsVC, animated: false, completion: nil)
    }
    
    func presentVPNConnectionsVC() {
        let vpnConnectionsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: StoryboardStrings.vpnConnectionsVCID) as! VPNConnectionsViewController
        vpnConnectionsVC.modalPresentationStyle = .overCurrentContext
        present(vpnConnectionsVC, animated: false, completion: nil)
    }
    
    func presentWifiConnectionsVC() {
        let wifiConnectionsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: StoryboardStrings.wifiConnectionsVCID) as! WiFiConnectionsViewController
        wifiConnectionsVC.modalPresentationStyle = .overCurrentContext
        present(wifiConnectionsVC, animated: false, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let popOverSize = CGSize(width: view.bounds.width/2, height: view.bounds.height/2)
        if let vc = segue.destination as? BTUsersViewController {
            let controller = vc.popoverPresentationController
            controller?.delegate = self
            //            controller?.permittedArrowDirections = .down
            controller?.sourceView = dashboardItemsCollectionView.visibleCells[1].contentView
            controller?.sourceRect = dashboardItemsCollectionView.visibleCells[1].contentView.frame
            vc.preferredContentSize = popOverSize
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}

extension DashboardViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let location = touch.location(in: menuContainerView)
        let locationIsWithinMenu = location.x >= 0.0 && location.y >= 0.0 && location.x <= menuContainerView.frame.width && location.y <= menuContainerView.frame.height
        
        if menuShouldDisplay && !locationIsWithinMenu { return true }
        else { return false }
    }
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryboardStrings.dashboardItemRestoreID, for: indexPath) as? DashboardItemCollectionViewCell else { return UICollectionViewCell() }
        let item = items[indexPath.item]
        cell.itemName.text = item.name
        cell.itemImageView.image = item.image
        cell.notActiveImageView?.image = item.notActiveImage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 1 {
            presentWifiConnectionsVC()
        } else if indexPath.item == 2 {
            presentBTUsersVC()
        } else if indexPath.item == 3 {
            presentNFCTransmissionsVC()
        } else if indexPath.item == 5 {
            presentVPNConnectionsVC()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViewWidth/3.2, height: itemHeight)
    }
    
}

extension DashboardViewController: UIPopoverPresentationControllerDelegate {
    
}

extension DashboardViewController: MonitorsSensorStatusChangeDelegate {
    func changeInStatus() {
        items[0] = DashboardItem(type: .lte(signalStrength: .noSignal))
        socketManager.updateInterval = 300
        overallConnectionStatus.attributedText = overallConnectionStatusText(forSignalStrength: .missingCriticalSignal)
        
        dashboardItemsCollectionView.reloadData()
    }
}

extension DashboardViewController: AggregateConnectionPriorityDelegate {
    func updateConnectionStatus(withPriorityItems priorityItems: [(item: DashboardItem, value: Float)]) {
            let priorityItems = priorityItems.map({($0.item, convert(prioritySliderValue: $0.value))})
            let overallSignalStrength = calculateOverallSignalStrength(from: priorityItems)
            overallConnectionStatus.attributedText = overallConnectionStatusText(forSignalStrength: overallSignalStrength)
    }
}



