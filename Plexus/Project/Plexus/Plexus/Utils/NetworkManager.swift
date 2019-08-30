//
//  NetworkManager.swift
//  Plexus
//
//  Created by Anik on 30/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager: NSObject {
    
    private enum NetworkPath: String {
        case wishlistRequest = "5d68b91e3300003500b685c8"
        case postedTweet
        
        static let baseURL = "http://www.mocky.io/v2/"
        
        var url: String {
            return NetworkPath.baseURL + self.rawValue
        }
    }
    
    private struct NetworkParameter {
        static let deviceToken = "deviceToken"
        static let hashtags = "hashtags"
        static let tweetRequestId = "tweetRequestId"
        static let tweetId = "tweetId"
    }
    
    // MARK:- TweetRequest services
    func getWishListRequest(completion: @escaping ([WishlistRequest]?) -> Void) {
        let urlString = NetworkPath.wishlistRequest.url
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let wishlistRequest = try decoder.decode([WishlistRequest].self, from: data)
                completion(wishlistRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    

}
