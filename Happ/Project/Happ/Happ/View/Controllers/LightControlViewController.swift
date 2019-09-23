//
//  LightControlViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class LightControlViewController: UIViewController {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var voltageLabel: UILabel!
    @IBOutlet weak var applianceNameLabel: UILabel!
    
    @IBOutlet weak var brightnessSlider: TactileSlider!
    @IBOutlet weak var brightnessLabel: UILabel!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet weak var hueSelectionCollectionView: UICollectionView!
    
    var appliance: Appliance?
    var hueSettins: [Any] = []
    var selectedHue: Hue?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        hueSelectionCollectionView.delegate = self
        hueSelectionCollectionView.dataSource = self
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //hueSelectionCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func setupViews() {
        //temparature
        //setBrightnessValue(value: Int((appliance?.settings!.hueSettings.)!))
        //Voltage
        voltageLabel.text = "\(appliance?.voltage ?? 0)"
        //room name
        roomNameLabel.text = "\(appliance?.room ?? "")"
        //appliance name
        //print("\(appliance?.settings?.hueSettings)")
        //hueSelectionCollectionView.reloadData()
        hueSettins = (appliance?.settings?.hueSettings!.allObjects)!
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        let dataManager = DataManager()
        do {
            try dataManager.updateAppliance(appliance: appliance!)
        } catch {
            print("Failed saving light appliance")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func brightnessChanged(_ sender: TactileSlider) {
        setBrightnessValue(value: Int(sender.value))
    }
    
    func setBrightnessValue(value: Int) {
        brightnessLabel.text = "\(value)%"
        
        if (appliance?.settings?.hueSettings?.contains(selectedHue))! {
            //print("selected hue contains in set")
            selectedHue?.brightness = Float(value)
            //appliance?.settings?.hueSettings.
        }
 
        brightnessSlider.setThumbOpacity(opacity: Float(Double(value)/100.0))
        valueView.frame.origin.y = brightnessSlider.frame.height - brightnessSlider.positionForValue(Float(value)) - 16
    }

}

extension LightControlViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hueSettins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hueCell", for: indexPath) as! HueCell
        //cell.itemTitle.text = items[indexPath.row]
        if hueSettins.count > 0 {
            let hue = hueSettins[indexPath.row] as! Hue
            cell.hueColorView.backgroundColor = ColorUtils.hexStringToUIColor(hex: hue.color!)
            if hue.brightness != 0 {
                cell.colorViewHeight.constant = CGFloat((hue.brightness/77) * 100)
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if hueSettins.count > 0 {
            selectedHue = hueSettins[indexPath.row] as? Hue
            brightnessSlider.thumbTint = ColorUtils.hexStringToUIColor(hex: selectedHue!.color!)
        }
    }
    
}
