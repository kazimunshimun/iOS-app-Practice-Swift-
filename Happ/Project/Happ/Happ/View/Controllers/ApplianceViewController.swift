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
    
    var applianceData: [Appliance] = []
    var roomData: [String] = []
    var roomApplianceData: [Appliance] = []
    var selectedRoomIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        
        //get unique room name
        for appliance in applianceData {
            if !roomData.contains(appliance.room!) {
                roomData.append(appliance.room!)
            }
        }
        
        roomCollectionView.delegate = self
        roomCollectionView.dataSource = self
        
        applianceCollectionView.register(UINib(nibName: "ApplianceItemCell", bundle: nil), forCellWithReuseIdentifier: "itemCell")
        applianceCollectionView.delegate = self
        applianceCollectionView.dataSource = self
        
        getApplianceForRoom(roomName: roomData[selectedRoomIndex])
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
            return roomData.count
        } else {
            return roomApplianceData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.roomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "roomCell", for: indexPath) as! RoomCell
            //cell.itemTitle.text = items[indexPath.row]
            cell.nameLabel.text = roomData[indexPath.row]
            if indexPath.row == selectedRoomIndex {
                cell.nameLabel.textColor = .white
                cell.roomBackgroundView.backgroundColor = ColorUtils.hexStringToUIColor(hex: "1A8DFF")
            } else {
                cell.nameLabel.textColor = .black
                cell.roomBackgroundView.backgroundColor = .white
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ApplianceItemCell
            cell.itemTitle.text = roomApplianceData[indexPath.row].name
            cell.itemImageView.image = UIImage(named: roomApplianceData[indexPath.row].imageName!)
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.roomCollectionView {
            selectedRoomIndex = indexPath.row
            roomCollectionView.reloadData()
            getApplianceForRoom(roomName: roomData[selectedRoomIndex])
        } else {
            
        }
    }
    
    private func getApplianceForRoom(roomName: String) {
        roomApplianceData = []
        for appliance in applianceData {
            if appliance.room! == roomName {
                roomApplianceData.append(appliance)
            }
        }
        applianceCollectionView.reloadData()
    }
    
}
