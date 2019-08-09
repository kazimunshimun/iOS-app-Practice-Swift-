//
//  BookingData.swift
//  Navigo
//
//  Created by Anik on 9/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation
import CoreLocation

final internal class BookingData {
    static let shared = BookingData()
    
    let names = ["Sushi Place", "Mile-End",
                 "Pho Montreal", "Rigolati", "Dae Jang",
                 "Time Out"]
    let imageNames = ["sushi_place_1", "sushi_place_2", "sushi_place_3",
                      "soup_place_1", "soup_place_2", "soup_place_3",
                      "burger_place_1", "burger_place_2", "burger_place_3",
                      "user_image", "profile_photo", "driver_icon"]
    let timeAndDate: [String] = ["2:20 12/08/2019", "1:32 15/08/2019", "4:25 15/08/2019", "3:59 16/08/2019", "1:47 18/08/2019", "2:50 19/08/2019", "1:30 20/08/2019", "4:30 20/08/2019", "3:40 21/08/2019"]
    let type: [BookingType] = [.dinner, .meeting, .lunch, .brunch, .meeting, .lunch]
    let locations: [CLLocation] = [CLLocation(latitude: 51.4976549, longitude: -0.2117534),
                                   CLLocation(latitude: 51.4970644, longitude: -0.2126093),
                                   CLLocation(latitude: 51.4962299, longitude: -0.2106902),
                                   CLLocation(latitude: 51.4958147, longitude: -0.2086598),
                                   CLLocation(latitude: 51.4971387, longitude: -0.2130881),
                                   CLLocation(latitude: 51.4960969, longitude: -0.2087144),
                                   CLLocation(latitude: 51.4979636, longitude: -0.2074568),
                                   CLLocation(latitude: 51.4948706, longitude: -0.211411),
                                   CLLocation(latitude: 51.494379, longitude: -0.2103103)]
    
    func getBookings(completion: ([BookingEntity]) -> Void) {
        var bookingList: [BookingEntity] = []
        
        let imageGroup: [[String]] = [[imageNames[0], imageNames[1], imageNames[2]], [imageNames[9], imageNames[10], imageNames[11]], [imageNames[3], imageNames[4], imageNames[5]], [imageNames[2], imageNames[5], imageNames[4]], [imageNames[11], imageNames[9], imageNames[10]], [imageNames[6], imageNames[7], imageNames[8]]]
        
        for i in 0..<names.count {
            let booking = BookingEntity(id: i, timeDate: timeAndDate[i], imagesName: imageGroup[i], name: names[i], type: type[i], location: locations[i])
            bookingList.append(booking)
        }
        completion(bookingList)
    }
}
