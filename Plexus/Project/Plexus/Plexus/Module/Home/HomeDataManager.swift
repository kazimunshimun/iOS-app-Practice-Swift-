//
//  HomeDataManager.swift
//  Plexus
//
//  Created by Anik on 1/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class HomeDataManager: HomeDataManagerInputProtocol {
    
    private let networkManager: NetworkManager = NetworkManager()
    var remoteRequestHandler: HomeDataManagerOutputProtocol?
    
    func retrieveHomeCourses() {
        networkManager.getHomeCourseRequest( completion: { (homeRequest) in
            self.remoteRequestHandler?.onHomeCoursesRetrieved(homeRequest!)
        })
    }
}
