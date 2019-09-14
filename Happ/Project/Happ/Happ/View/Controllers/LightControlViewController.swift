//
//  LightControlViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class LightControlViewController: UIViewController {

    @IBOutlet weak var brightnessSlider: TactileSlider!
    @IBOutlet weak var brightnessLabel: UILabel!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var hueSelectionCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hueSelectionCollectionView.delegate = self
        hueSelectionCollectionView.dataSource = self
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func brightnessChanged(_ sender: TactileSlider) {
        setBrightnessValue(value: Int(sender.value))
    }
    
    func setBrightnessValue(value: Int) {
        brightnessLabel.text = "\(value)%"
        brightnessSlider.renderer.thumbLayer.opacity = Float(Double(value)/100.0)
        valueView.frame.origin.y = brightnessSlider.frame.height - brightnessSlider.positionForValue(Float(value)) - 16
    }

}

extension LightControlViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hueCell", for: indexPath) as! HueCell
        //cell.itemTitle.text = items[indexPath.row]
        return cell
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        applianceDelegate?.applianceSelected(name: items[indexPath.row])
    }
    */
}
