//
//  ApplianceViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ApplianceViewController: UIViewController {

    @IBOutlet weak var roomCollectionView: UICollectionView!
    @IBOutlet weak var applianceCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        roomCollectionView.delegate = self
        roomCollectionView.dataSource = self
        
        applianceCollectionView.register(UINib(nibName: "ApplianceItemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        applianceCollectionView.delegate = self
        applianceCollectionView.dataSource = self
        
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

extension ApplianceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.roomCollectionView {
            return 5
        } else {
            return 6
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.roomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roomCell", for: indexPath) as! RoomCell
            //cell.itemTitle.text = items[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ApplianceItemCell
            //cell.itemTitle.text = items[indexPath.row]
            //cell.nameLabel.sizeToFit()
            return cell
        }
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     applianceDelegate?.applianceSelected(name: items[indexPath.row])
     }
     */
}
