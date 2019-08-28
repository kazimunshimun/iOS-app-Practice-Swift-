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

    var documentList: [DocumentEntity] = []
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
        fetchDocumentList()
    }
    
    private func fetchDocumentList() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Document")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let date = data.value(forKey: "date") as! NSDate
                let title = data.value(forKey: "title") as! String
                let writer = data.value(forKey: "writer") as! String
                let content = data.value(forKey: "content") as! NSAttributedString
                let document = DocumentEntity(date: date, title: title, writer: writer, content: content)
                self.documentList.append(document)
                print(date)
                print(title)
                print(writer)
                print(content)
            }
            readerCollectionView.reloadData()
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
                newDocumentViewController.documentContent = documentList[indexPath.row].content
                newDocumentViewController.isReaderView = true
                self.present(newDocumentViewController, animated: true)
                collectionView.deselectItem(at: indexPath, animated: true)
            }
        }
    }
}
