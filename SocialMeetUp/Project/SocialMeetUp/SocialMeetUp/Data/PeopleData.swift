//
//  PeopleData.swift
//  SocialMeetUp
//
//  Created by Anik on 29/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class PeopleData {
    static let shared = PeopleData()
    
    private let senders: [People] = [People(id: "001", name: "Dina Meyer", imageName: "joe"),
                             People(id: "002", name: "Stephane Moreau", imageName: "paul"),
                             People(id: "003", name: "Andi Lane", imageName: "carl"),
                             People(id: "004", name: "Anson Buck", imageName: "john"),
                             People(id: "005", name: "Marie Ann", imageName: "marie"),
                             People(id: "006", name: "Elon Mask", imageName: "elon"),
                             People(id: "007", name: "Blake Marie", imageName: "blake"),
                             People(id: "008", name: "Dale Aldrin", imageName: "dale"),
                             People(id: "009", name: "Kat Hope", imageName: "kat"),
                             People(id: "010", name: "Mark Gomez", imageName: "mark"),
                             People(id: "011", name: "Mila Curry", imageName: "mila"),
                             People(id: "012", name: "Adam Thomas", imageName: "adam"),
                             People(id: "013", name: "Ema Poter", imageName: "profile_ava"),
                             People(id: "014", name: "Oliva Johnson", imageName: "oliva")]
    
    func getPeople() -> [People] {
        return senders
    }
    
    func getPeople(withCount: Int) -> [People]{
        var peoples: [People] = []
        
        for _ in 0..<withCount {
            peoples.append(senders.random()!)
        }
        return peoples
    }
}
