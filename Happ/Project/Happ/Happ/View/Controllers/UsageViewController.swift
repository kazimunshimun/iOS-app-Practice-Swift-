//
//  UsageViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class UsageViewController: UIViewController {

    @IBOutlet weak var todaysUsageView: CircularProgressBar!
    @IBOutlet weak var overallUsageView: CircularProgressBar!
    
    @IBOutlet weak var graphCollectionVIew: UICollectionView!
    @IBOutlet weak var legendCollectionView: UICollectionView!
    @IBOutlet weak var applianceUsageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        graphCollectionVIew.delegate = self
        graphCollectionVIew.dataSource = self
        
        legendCollectionView.delegate = self
        legendCollectionView.dataSource = self
        
        applianceUsageCollectionView.delegate = self
        applianceUsageCollectionView.dataSource = self
        
        todaysUsageView.setProgress(to: 26, withAnimation: true)
        
        //overallUsageView.safePercent = 500
        overallUsageView.maximum = 600
        overallUsageView.setProgress(to: 467, withAnimation: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UsageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.applianceUsageCollectionView {
            return 5
        } else if collectionView == self.graphCollectionVIew {
            return 6
        } else {
            return 6
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.applianceUsageCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "applianceUsageCell", for: indexPath) as! ApplianceUsageCell
            //cell.itemTitle.text = items[indexPath.row]
            return cell
        } else if collectionView == self.graphCollectionVIew {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usageBarCell", for: indexPath) as! UsageBarCell
            //cell.itemTitle.text = items[indexPath.row]
            cell.barHeight.constant = CGFloat(indexPath.row + 1) * CGFloat(9.0)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usageLegendCell", for: indexPath) as! UsageLegendCell
            //cell.itemTitle.text = items[indexPath.row]
            cell.nameLabel.sizeToFit()
            return cell
        }
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     applianceDelegate?.applianceSelected(name: items[indexPath.row])
     }
     */
}
