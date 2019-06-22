//
//  ProfileData.swift
//  SocialMeetUp
//
//  Created by Anik on 22/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

final internal class ProfileData {
    static let shared = ProfileData()
    
    let profile: Profile = Profile(profileImage: "Avatar", meetupCount: 156, name: "Fabiena Rhodes", messageCount: 7, notificationCount: 5, aboutMe: "When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up.", timeline: "You may need to create an account to use some of our Services. You are responsible for safeguarding your account, so use a strong password and limit its use to this account. We cannot and will not be liable for any loss or damage arising from your failure to comply with the above.")

    
    
    func getProfile(completion: (Profile) -> Void) {
        completion(profile)
    }
    
}
