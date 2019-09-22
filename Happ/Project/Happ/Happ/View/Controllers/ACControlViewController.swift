//
//  ACControlViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ACControlViewController: UIViewController {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var voltageLabel: UILabel!
    @IBOutlet weak var applianceNameLabel: UILabel!
    
    @IBOutlet weak var temparatureSlider: TactileSlider!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var valueView: UIView!
    
    var appliance: Appliance?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        //temparature
        setTempValue(value: Int((appliance?.settings!.temparature)!))
        //Voltage
        voltageLabel.text = "\(appliance?.voltage ?? 0)"
        //room name
        roomNameLabel.text = "\(appliance?.room ?? "")"
        //appliance name
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func temparatureChanged(_ sender: TactileSlider) {
        setTempValue(value: Int(sender.value))
    }
    
    func setTempValue(value: Int) {
        tempLabel.text = "\(value)°c"
        valueView.frame.origin.y = temparatureSlider.frame.height - temparatureSlider.positionForValue(Float(value)) - 16
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
