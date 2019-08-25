//
//  DocumentsViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {

    let documentList: [String] = ["Song for the Old Ones", "Awaking in New York", "The Heart of a Woman", "The Mothering Blackness", "Mom & Me & Mom"]
    
    @IBOutlet weak var documentCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationView()
        configureCollectionView()
    }

    private func setupNavigationView() {
        let logo = UIImage(named: "logo_small")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func configureCollectionView() {
        documentCollectionView.register(UINib(nibName: "AddCell", bundle: nil), forCellWithReuseIdentifier: "addCell1")
        documentCollectionView.register(UINib(nibName: "DocumentCell", bundle: nil), forCellWithReuseIdentifier: "documentCell1")
    }
}

extension DocumentsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell1", for: indexPath) as! AddCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath) as! DocumentCell
            if indexPath.row <= documentList.count {
                cell.dataView.isHidden = false
                cell.titleLabel.text = documentList[indexPath.row - 1]
            } else {
                cell.dataView.isHidden = true
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var neededEmptyCell = 0
        if documentList.count < 5 {
            neededEmptyCell = 5 - documentList.count
        }
        return neededEmptyCell + 1 + documentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colloection view item clicked: \(indexPath.row)")
        if indexPath.row == 0 {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Documents", bundle: nil)
            let newDocumentViewController = storyBoard.instantiateViewController(withIdentifier: "newDocumentView") as! NewDocumentViewController
            self.show(newDocumentViewController, sender: nil)
            collectionView.deselectItem(at: indexPath, animated: true)
        }
    }
}
