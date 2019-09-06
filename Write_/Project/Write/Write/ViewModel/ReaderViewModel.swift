//
//  ReaderViewModel.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class ReaderViewModel {
    
    let dataManager: DataManager = DataManager()
    weak var dataSource : GenericDataSource<Document>?
    
    init(dataSource : GenericDataSource<Document>?) {
        self.dataSource = dataSource
    }
    
    func fetchReaderDocumentList() {
        do {
            self.dataSource?.data.value = try dataManager.fetchDocument()
        } catch {
            print("Failed")
        }
    }
}
