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
        case homeRequest = "5d6950c63300005800b689eb"
        case profileRequest = "5d68cf3b3300002700b68664"
        case onlineRequest = "5d695d4c3300006800b68a15"
        
        static let baseURL = "http://www.mocky.io/v2/"
        
        var url: String {
            return NetworkPath.baseURL + self.rawValue
        }
    }
    
    // MARK:- Request services
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
    
    func getHomeCourseRequest(completion: @escaping (CourseRequest?) -> Void) {
        let urlString = NetworkPath.homeRequest.url
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let courseRequest = try decoder.decode(CourseRequest.self, from: data)
                completion(courseRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getProfileRequest(completion: @escaping (ProfileRequest?) -> Void) {
        let urlString = NetworkPath.profileRequest.url
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let profileRequest = try decoder.decode(ProfileRequest.self, from: data)
                completion(profileRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
    
    func getOnlineRequest(completion: @escaping ([OnlineRequest]?) -> Void) {
        let urlString = NetworkPath.onlineRequest.url
        AF.request(urlString).response { response in
            guard let data = response.data else { return }
            do {
                let decoder = JSONDecoder()
                let onlineRequest = try decoder.decode([OnlineRequest].self, from: data)
                completion(onlineRequest)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
