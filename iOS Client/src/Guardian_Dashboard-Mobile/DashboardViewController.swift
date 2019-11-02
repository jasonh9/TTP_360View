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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    
}

