//
//  PostFullViewController.swift
//  Backpack
//
//  Created by Anik on 12/4/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class PostFullViewController: UIViewController {
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var tripLocationLabel: UILabel!
    @IBOutlet weak var tripCurrentStatusLabel: UILabel!
    @IBOutlet weak var tripUserImageView: RoundedCornerImageView!
    @IBOutlet weak var tripUserNameLabel: UILabel!
    @IBOutlet weak var tripCreationDateLabel: UILabel!
    @IBOutlet weak var tripDescriptionLabel: UILabel!
    @IBOutlet weak var isLovedTripButton: UIButton!
    
    
    var tripDetail: Trip?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    func updateUI() {
        tripImageView.image = UIImage(named: tripDetail!.tripImage)
        tripLocationLabel.text = tripDetail!.tripLocation
        tripCurrentStatusLabel.text = tripDetail!.currentStatus
        tripUserImageView.image = UIImage(named: tripDetail!.people.imageName)
        tripUserNameLabel.text = tripDetail?.people.name
        
        if tripDetail!.isLoved {
            isLovedTripButton.setImage(UIImage(named: "heart_selected"), for: .normal)
        } else {
            isLovedTripButton.setImage(UIImage(named: "heart_unselected"), for: .normal)
        }
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
