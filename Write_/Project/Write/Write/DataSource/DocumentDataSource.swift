//
//  DocumentDataSource.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import UIKit

class DocumentDataSource : GenericDataSource<UIColor>, UICollectionViewDataSource {
    
    let formatter = DateFormatter()
    
    override init() {
        formatter.dateFormat = "dd MMMM, yyyy"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "documentCell1", for: indexPath)
        
        //cell.backgroundColor = data.value[indexPath.row]
        return cell
    }
}
