//
//  ReaderViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit

class ReaderViewController: UIViewController {

    let documentList: [String] = ["Song for the Old Ones", "Awaking in New York", "The Heart of a Woman", "The Mothering Blackness", "Mom & Me & Mom"]
    @IBOutlet weak var readerCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

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
        readerCollectionView.register(UINib(nibName: "DocumentCell", bundle: nil), forCellWithReuseIdentifier: "documentCell1")
    }
    
}

extension ReaderViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath) as! DocumentCell
        if indexPath.row < documentList.count {
            cell.dataView.isHidden = false
            cell.titleLabel.text = documentList[indexPath.row]
        } else {
            cell.dataView.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var neededEmptyCell = 0
        if documentList.count < 6 {
            neededEmptyCell = 6 - documentList.count
        }
        return neededEmptyCell + documentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colloection view item clicked: \(indexPath.row)")
    }
}
