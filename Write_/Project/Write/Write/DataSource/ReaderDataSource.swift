//
//  ReaderDataSource.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class ReaderDataSource : GenericDataSource<Document>, UICollectionViewDataSource {
    let formatter = DateFormatter()
    
    override init() {
        formatter.dateFormat = "dd MMMM, yyyy"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var neededEmptyCell = 0
        if data.value.count < 6 {
            neededEmptyCell = 6 - data.value.count
        }
        return neededEmptyCell + data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath) as! DocumentCell
        
        if indexPath.row < data.value.count {
            cell.dataView.isHidden = false
            cell.titleLabel.text = data.value[indexPath.row].title
            cell.dateLabel.text = formatter.string(from: data.value[indexPath.row].date!)
            
            let content = data.value[indexPath.row].content as! NSAttributedString
            cell.pageNumberLabel.text = "\(getPageCount(forContent: content)) pages"
        } else {
            cell.dataView.isHidden = true
        }
        return cell
    }
    
    private func getPageCount(forContent content: NSAttributedString) -> Int {
        var lineCount = 0
        content.string.enumerateLines { (str, _) in
            lineCount += 1
        }
        //print("line count \(lineCount)")
        return ((lineCount - 2) / 25) + 1
    }
}
