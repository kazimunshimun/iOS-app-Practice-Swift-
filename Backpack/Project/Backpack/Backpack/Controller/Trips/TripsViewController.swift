//
//  TripsViewController.swift
//  Backpack
//
//  Created by Anik on 21/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var requestCollectionView: UICollectionView!
    @IBOutlet weak var invitesCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        requestCollectionView.delegate = self
        requestCollectionView.dataSource = self
        
        invitesCollectionView.delegate = self
        invitesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == requestCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripRequestCell", for: indexPath) as! TripRequestCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "invitesCell", for: indexPath) as! TripRequestCollectionViewCell
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
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
