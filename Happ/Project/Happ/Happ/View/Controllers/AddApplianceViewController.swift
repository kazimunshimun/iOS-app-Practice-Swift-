//
//  AddApplianceViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import Pulsator

class AddApplianceViewController: UIViewController {

    @IBOutlet weak var pulseView: UIView!
    @IBOutlet weak var applianceCollectionView: UICollectionView!
    
    let pulsator = Pulsator()
    
    var timerForAppliance = Timer()
    var timerCounter = 2
    let updateNeededArray = [1, 4, 5]
    
    var applianceData: [Appliance] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        pulsator.numPulse = 5
        pulsator.radius = 600
        //pulsator.duration = 10
        pulsator.pulseInterval = 0.2
        pulsator.backgroundColor = ColorUtils.hexStringToUIColor(hex: "2894FF").cgColor
        pulseView.layer.superlayer?.insertSublayer(pulsator, below: pulseView.layer)
        pulsator.start()
        
        applianceCollectionView.delegate = self
        applianceCollectionView.dataSource = self
        
        timerForAppliance.invalidate()
        // start the timer
        timerForAppliance = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(applianceTimerAction), userInfo: nil, repeats: true)
    }
    
    @objc func applianceTimerAction() {
        if timerCounter >= 0 {
            //update appliance
            applianceData[updateNeededArray[timerCounter]].isVisible = true
            //reload collection view
            applianceCollectionView.reloadData()
            timerCounter -= 1
        } else {
            timerForAppliance.invalidate()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pulseView.layer.layoutIfNeeded()
        pulsator.position = pulseView.layer.position
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        pulsator.stop()
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

extension AddApplianceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newApplianceCell", for: indexPath) as! NewApplianceCell
        
        if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 4 {
            let appliance = applianceData[indexPath.row + 1]
            
            if appliance.isVisible {
                cell.contentsView.isHidden = false
            } else {
                cell.contentsView.isHidden = true
            }
            cell.itemImageView.image = UIImage(named: appliance.imageName!)
            cell.nameLabel.text = appliance.name
        } else {
            cell.contentsView.isHidden = true
        }
 
        return cell
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     applianceDelegate?.applianceSelected(name: items[indexPath.row])
     }
     */
}
