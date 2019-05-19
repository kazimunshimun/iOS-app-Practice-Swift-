//
//  AddTripsPhotoViewController.swift
//  Backpack
//
//  Created by Anik on 29/3/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class AddTripsPhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var addPhotoCollectionView: UICollectionView!
    var imagePicker = UIImagePickerController()
    
    var addedImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addPhotoCollectionView.delegate = self
        addPhotoCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("indexPath row: \(indexPath.row)")
        if indexPath.row == addedImages.count || addedImages.count == 0 {
            print("addPhotoCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addPhotoButtonCell", for: indexPath)
            return cell
        } else {
            print("PhotoCell")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addPhotoCell", for: indexPath) as! AddPhotosCollectionViewCell
            cell.photoImageView.image = addedImages[indexPath.row]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addedImages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("indexPath row: \(indexPath.row)")
        if indexPath.row == addedImages.count || addedImages.count == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
               // print("Button capture")
                
                imagePicker.delegate = self
                imagePicker.sourceType = .savedPhotosAlbum
                imagePicker.allowsEditing = false
                
                present(imagePicker, animated: true, completion: nil)
            }
        } else {
            print("PhotoCell")
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTouched(_ sender: Any) {
        self.showSpinner(onView: self.view, showText: true, text: "The connections seems to be slow", position: .center)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.removeSpinner()
            let storyBoard: UIStoryboard = UIStoryboard(name: "TabMenu", bundle: nil)
            let tripTabViewController = storyBoard.instantiateViewController(withIdentifier: "tabMenuController") as! MenuViewController
            tripTabViewController.selectedIndex = 2
            UIApplication.shared.keyWindow?.rootViewController = tripTabViewController
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        addedImages.append(image)
        addPhotoCollectionView.reloadData()
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
