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
    let pulsator = Pulsator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pulsator.numPulse = 6
        pulsator.radius = 600
        //pulsator.position = self.pulseView.layer.position
        //pulseView.layer.layoutIfNeeded()
        //pulsator.position = pulseView.layer.position
        //pulseView.layer.addSublayer(pulsator)
        pulseView.layer.superlayer?.insertSublayer(pulsator, below: pulseView.layer)
        pulsator.start()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pulseView.layer.layoutIfNeeded()
        pulsator.position = pulseView.layer.position
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
