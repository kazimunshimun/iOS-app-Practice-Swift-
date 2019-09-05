//
//  ReaderViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import CoreData

class ReaderViewController: UIViewController {

    var documentList: [Document] = []
    @IBOutlet weak var readerCollectionView: UICollectionView!
    let dataManager: DataManager = DataManager()
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formatter.dateFormat = "dd MMMM, yyyy"
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
        fetchDocumentList()
    }
    
    private func fetchDocumentList() {
        do {
            documentList = try dataManager.fetchDocument()
            if documentList.count > 0 {
                readerCollectionView.reloadData()
            }
        } catch {
            print("Failed")
        }
    }
    
}

extension ReaderViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath) as! DocumentCell
        if indexPath.row < documentList.count {
            cell.dataView.isHidden = false
            cell.titleLabel.text = documentList[indexPath.row].title
            cell.dateLabel.text = formatter.string(from: documentList[indexPath.row].date!)
            
            var lineCount = 0
            let content = documentList[indexPath.row].content as! NSAttributedString
            content.string.enumerateLines { (str, _) in
                lineCount += 1
            }
            print("line count \(lineCount)")
            let pageCount = ((lineCount - 2) / 25) + 1
            cell.pageNumberLabel.text = "\(pageCount) pages"
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
        if indexPath.row < documentList.count {
            if documentList.count > 0 {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Documents", bundle: nil)
                let newDocumentViewController = storyBoard.instantiateViewController(withIdentifier: "newDocumentView") as! NewDocumentViewController
                newDocumentViewController.documentContent = documentList[indexPath.row].content as! NSAttributedString
                newDocumentViewController.isReaderView = true
                self.present(newDocumentViewController, animated: true)
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}
