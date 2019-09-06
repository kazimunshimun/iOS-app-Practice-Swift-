//
//  DocumentViewModel.swift
//  Write
//
//  Created by Anik on 6/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class DocumentViewModel: ReaderViewModel {
    
    var lastDocumentId: Int16 = 0
    
    func fetchDocumentList() {        
        do {
            self.dataSource?.data.value = try dataManager.fetchDocument()
            if (self.dataSource?.data.value.count)! > 0 {
                lastDocumentId = self.dataSource!.data.value[self.dataSource!.data.value.count - 1].docid
            }
        } catch {
            print("Failed")
        }
    }
}
