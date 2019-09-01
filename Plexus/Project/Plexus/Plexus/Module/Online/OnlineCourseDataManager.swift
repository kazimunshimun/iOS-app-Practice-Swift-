//
//  OnlineCourseDataManager.swift
//  Plexus
//
//  Created by Anik on 31/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class OnlineCouseDataManager: OnlineDataManagerInputProtocol {
    private let networkManager: NetworkManager = NetworkManager()
    var remoteRequestHandler: OnlineDataManagerOutputProtocol?
    
    func retrieveOnlineCourses() {
        networkManager.getOnlineRequest( completion: { (onlineRequest) in
            //self.onlineCourselist = onlineRequest!
            //self.courseCollectionView.reloadData()
            self.remoteRequestHandler?.onOnlineCoursesRetrieved(onlineRequest!)
        })
    }
}
