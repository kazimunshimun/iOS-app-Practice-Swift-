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

    //var documentList: [Document] = []
    @IBOutlet weak var readerCollectionView: UICollectionView!
    let dataSource = ReaderDataSource()
    
    lazy var viewModel : ReaderViewModel = {
        let viewModel = ReaderViewModel(dataSource: dataSource)
        return viewModel
    }()
    
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
        readerCollectionView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.readerCollectionView.reloadData()
        }
        //fetchDocumentList()
        self.viewModel.fetchReaderDocumentList()
    }
}

extension ReaderViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("colloection view item clicked: \(indexPath.row)")
        if indexPath.row < self.dataSource.data.value.count {
            if self.dataSource.data.value.count > 0 {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Documents", bundle: nil)
                let newDocumentViewController = storyBoard.instantiateViewController(withIdentifier: "newDocumentView") as! NewDocumentViewController
                newDocumentViewController.documentContent = self.dataSource.data.value[indexPath.row].content as! NSAttributedString
                newDocumentViewController.isReaderView = true
                self.present(newDocumentViewController, animated: true)
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}
