//
//  TimerViewController.swift
//  Happ
//
//  Created by Anik on 10/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var applianceLabel: UILabel!
    @IBOutlet weak var weekCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        weekCollectionView.delegate = self
        weekCollectionView.dataSource = self
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }

}

extension TimerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weekCell", for: indexPath) as! WeekSelectionCell
        return cell
    }
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     applianceDelegate?.applianceSelected(name: items[indexPath.row])
     }
     */
}
