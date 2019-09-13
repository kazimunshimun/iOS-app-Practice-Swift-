//
//  UsageViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class UsageViewController: UIViewController {

    @IBOutlet weak var applianceUsageCollectionView: UICollectionView!
    @IBOutlet weak var todaysUsageView: CircularProgressBar!
    @IBOutlet weak var overallUsageView: CircularProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "applianceUsageCell", for: indexPath) as! ApplianceUsageCell
        //cell.itemTitle.text = items[indexPath.row]
        return cell
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     applianceDelegate?.applianceSelected(name: items[indexPath.row])
     }
     */
}
