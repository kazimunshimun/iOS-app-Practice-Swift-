//
//  AddTripsPhotoViewController.swift
//  Backpack
//
//  Created by Anik on 29/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AddTripsPhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "TabMenu", bundle: nil)
        let tripTabViewController = storyBoard.instantiateViewController(withIdentifier: "tabMenuController") as! MenuViewController
        tripTabViewController.selectedIndex = 2
        UIApplication.shared.keyWindow?.rootViewController = tripTabViewController
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
