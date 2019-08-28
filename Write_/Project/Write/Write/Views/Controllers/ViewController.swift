//
//  ViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blinkView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startBlink()
    }

    func startBlink() {
        UIView.animate(withDuration: 0.7,//Time duration
            delay:0.0,
            options:[.allowUserInteraction, .curveEaseInOut, .autoreverse, .repeat],
            animations: {
                UIView.setAnimationRepeatCount(3)
                self.blinkView.alpha = 0.0
        }, completion: { (finished: Bool) in
            self.startSignInAnimation()
        })
    }
    
    private func startSignInAnimation() {
        print("sign in animation started")
    }
}

