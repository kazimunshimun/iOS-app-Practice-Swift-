//
//  CongratsViewController.swift
//  Plexus
//
//  Created Anik on 23/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class CongratsViewController: UIViewController, CongratsViewProtocol {

    @IBOutlet weak var confettiImageView: UIImageView!
    @IBOutlet weak var boxImageView: UIImageView!
    
    var presenter: CongratsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        resetViewTransform()
    }

    @IBAction func proceedButtonClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.confettiImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.confettiImageView.alpha = 1
            
        }, completion: nil )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetViewTransform()
    }
    
    func resetViewTransform() {
        self.confettiImageView.alpha = 0
        self.confettiImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
}