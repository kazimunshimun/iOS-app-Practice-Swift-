//
//  ProfileDataManager.swift
//  Plexus
//
//  Created by Anik on 1/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class ProfileDataManager: ProfileDataManagerInputProtocol {
    private let networkManager: NetworkManager = NetworkManager()
    var remoteRequestHandler: ProfileDataManagerOutputProtocol?
    
    func retrieveProfile() {
        networkManager.getProfileRequest( completion: { (profile) in
            self.remoteRequestHandler?.onProfileRetrieved(profile!)
        })
    }
}
