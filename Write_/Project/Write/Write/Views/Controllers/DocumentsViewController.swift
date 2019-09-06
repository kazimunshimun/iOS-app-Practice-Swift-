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
    
    let dataSource = DocumentDataSource()
    lazy var viewModel : DocumentViewModel = {
        let viewModel = DocumentViewModel(dataSource: dataSource)
        return viewModel
    }()
    
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
        documentCollectionView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.documentCollectionView.reloadData()
        }
        self.viewModel.fetchDocumentList()
    }
    
}

extension DocumentsViewController: DataUpdated {
    func documentsUpdated() {
        self.dataSource.data.value.removeAll()
        self.viewModel.fetchDocumentList()
    }
}

extension DocumentsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colloection view item clicked: \(indexPath.row)")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Documents", bundle: nil)
        let newDocumentViewController = storyBoard.instantiateViewController(withIdentifier: "newDocumentView") as! NewDocumentViewController
        newDocumentViewController.delegate = self
        if indexPath.row == 0 {
            newDocumentViewController.documentId = self.viewModel.lastDocumentId + 1
            newDocumentViewController.isNewDocument = true
            self.present(newDocumentViewController, animated: true)
        } else {
            if indexPath.row <= self.dataSource.data.value.count {
                if self.dataSource.data.value.count > 0 {
                    //cell.titleLabel.text = documentList[indexPath.row - 1].title
                    newDocumentViewController.documentContent = self.dataSource.data.value[indexPath.row - 1].content as! NSAttributedString
                    newDocumentViewController.documentId = self.dataSource.data.value[indexPath.row - 1].docid
                    self.present(newDocumentViewController, animated: true)
                }
            }
        }
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
