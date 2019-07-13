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
    @IBOutlet weak var topMultiColorView: UIView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    public func updateTopView(isBottom: Bool) {
        bottomView.isHidden = isBottom
        fullLabel.isHidden = !isBottom
        //topMultiColorView.isHidden = isBottom ? true : false
        indicatorImageView.image = isBottom ? UIImage(named: "back_icon") : UIImage(named: "up_icon")
    }

}
