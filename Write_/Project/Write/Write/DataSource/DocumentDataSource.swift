//
//  DocumentDataSource.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class DocumentDataSource : GenericDataSource<Document>, UICollectionViewDataSource {
    
    let formatter = DateFormatter()
    
    override init() {
        formatter.dateFormat = "dd MMMM, yyyy"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var neededEmptyCell = 0
        if data.value.count < 5 {
            neededEmptyCell = 5 - data.value.count
        }
        return neededEmptyCell + 1 + data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell1", for: indexPath) as! AddCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath) as! DocumentCell
            if indexPath.row <= data.value.count {
                cell.dataView.isHidden = false
                if data.value.count > 0 {
                    cell.titleLabel.text = data.value[indexPath.row - 1].title
                    cell.dateLabel.text = formatter.string(from: data.value[indexPath.row - 1].date!)
                    
                    let content = data.value[indexPath.row - 1].content as! NSAttributedString
                    cell.pageNumberLabel.text = "\(Utils.getPageCount(forContent: content)) pages"
                }
            } else {
                cell.dataView.isHidden = true
            }
            return cell
        }
    }
}
