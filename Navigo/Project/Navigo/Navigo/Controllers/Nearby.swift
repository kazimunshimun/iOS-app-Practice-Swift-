//
//  NearbyViewController.swift
//  Navigo
//
//  Created by Anik on 12/7/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Panels
import UIKit

class Nearby: UIViewController, Panelable {

    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var headerPanel: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var fullLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var topMultiColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    public func updateTopView(isBottom: Bool) {
        bottomView.isHidden = isBottom
        fullLabel.isHidden = !isBottom
        backButton.setImage(isBottom ? UIImage(named: "back_icon") : UIImage(named: "up_icon"), for: .normal)
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
