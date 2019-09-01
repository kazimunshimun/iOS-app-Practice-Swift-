//
//  WishlistDataManager.swift
//  Plexus
//
//  Created by Anik on 1/9/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

class WishlistDataManager: WishlistDataManagerInputProtocol {
    
    private let networkManager: NetworkManager = NetworkManager()
    var remoteRequestHandler: WishlistDataManagerOutputProtocol?
    
    func retrieveWishlistCourses() {
        networkManager.getWishListRequest(completion: { (wishlist) in
            self.remoteRequestHandler?.onWishlistCoursesRetrieved(wishlist!)
        })
    }
}
