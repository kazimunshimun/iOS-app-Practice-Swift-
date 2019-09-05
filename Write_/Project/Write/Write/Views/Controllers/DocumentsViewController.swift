//
//  DocumentsViewController.swift
//  Write
//
//  Created by Anik on 24/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import UIKit
import CoreData

class DocumentsViewController: UIViewController {

    var documentList: [Document] = []
    var lastDocumentId: Int16 = 0
    let dataManager: DataManager = DataManager()
    let formatter = DateFormatter()
    
    @IBOutlet weak var documentCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        documentCollectionView.register(UINib(nibName: "AddCell", bundle: nil), forCellWithReuseIdentifier: "addCell1")
        documentCollectionView.register(UINib(nibName: "DocumentCell", bundle: nil), forCellWithReuseIdentifier: "documentCell1")
        fetchDocumentList()
    }
    
    private func fetchDocumentList() {
        do {
            documentList = try dataManager.fetchDocument()
            if documentList.count > 0 {
                lastDocumentId = documentList[documentList.count - 1].docid
                documentCollectionView.reloadData()
            }
        } catch {
            print("Failed")
        }
    }
}

extension DocumentsViewController: DataUpdated {
    func documentsUpdated() {
        self.documentList.removeAll()
        fetchDocumentList()
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
                if documentList.count > 0 {
                    cell.titleLabel.text = documentList[indexPath.row - 1].title
                    cell.dateLabel.text = formatter.string(from: documentList[indexPath.row - 1].date!)
                    var lineCount = 0
                    let content = documentList[indexPath.row - 1].content as! NSAttributedString
                    content.string.enumerateLines { (str, _) in
                        lineCount += 1
                    }
                    print("line count \(lineCount)")
                    let pageCount = ((lineCount - 2) / 25) + 1
                    cell.pageNumberLabel.text = "\(pageCount) pages"
                }
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
        let storyBoard: UIStoryboard = UIStoryboard(name: "Documents", bundle: nil)
        let newDocumentViewController = storyBoard.instantiateViewController(withIdentifier: "newDocumentView") as! NewDocumentViewController
        newDocumentViewController.delegate = self
        if indexPath.row == 0 {
            newDocumentViewController.documentId = lastDocumentId + 1
            newDocumentViewController.isNewDocument = true
            self.present(newDocumentViewController, animated: true)
        } else {
            if indexPath.row <= documentList.count {
                if documentList.count > 0 {
                    //cell.titleLabel.text = documentList[indexPath.row - 1].title
                    newDocumentViewController.documentContent = documentList[indexPath.row - 1].content as! NSAttributedString
                    newDocumentViewController.documentId = documentList[indexPath.row - 1].docid
                    self.present(newDocumentViewController, animated: true)
                }
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
