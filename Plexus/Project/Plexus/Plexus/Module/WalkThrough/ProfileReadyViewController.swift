//
//  ProfileReadyViewController.swift
//  Plexus
//
//  Created by Anik on 2/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ProfileReadyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getStartedButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabMenu", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabMenuController") as! MenuViewController
        self.show(vc, sender: nil)
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
