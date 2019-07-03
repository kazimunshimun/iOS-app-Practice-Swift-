//
//  FeedModelView.swift
//  SocialMeetUp
//
//  Created by Anik on 21/6/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//

import Foundation

struct FeedViewModel {
    
    weak var dataSource : GenericDataSource<Feed>?
    
    init(dataSource : GenericDataSource<Feed>?) {
        self.dataSource = dataSource
    }
    
    func fetchFeeds(feedType: FeedType) {
        FeedData.shared.getFeeds(type: feedType) { feeds in
            DispatchQueue.main.async {
                self.dataSource?.data.value = feeds
            }
        }
    }
}
