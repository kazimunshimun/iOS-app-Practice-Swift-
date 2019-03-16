//
//  WelcomeViewController.swift
//  Backpack
//
//  Created by Anik on 15/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var circleImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var isShowingBackground = false
    //var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //timer.invalidate()
        
        //changeViewTimer.fire()
        Timer.scheduledTimer(timeInterval: 10,
                             target: self,
                             selector: #selector(self.changeView),
                             userInfo: nil,
                             repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        //timer = Timer(timeInterval: 5, target: self, selector: #selector(changeView), userInfo: nil, repeats: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
        
    } 
    
    @objc func changeView() {
        if isShowingBackground {
            isShowingBackground = false
            backgroundImageView.image = UIImage(named: "Splash_2")
            circleImageView.image = UIImage(named: "eclipse_yellow")
            descriptionLabel.textColor = UIColor.white
        } else {
            isShowingBackground = true
            //backgroundImageView.image = UIImage.from(color: UIColor.white)
            backgroundImageView.image = UIImage(named: "Splash_1")
            circleImageView.image = UIImage(named: "eclipse")
            descriptionLabel.textColor = UIColor.lightGray
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "back"
        
        navigationItem.backBarButtonItem = backItem
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

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
