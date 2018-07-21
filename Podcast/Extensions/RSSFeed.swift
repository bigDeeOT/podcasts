//
//  RSSFeed.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/3/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation
import FeedKit

extension RSSFeed {
    func toEpisodes() -> [Episode] {
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        var episodes = [Episode]()
        items?.forEach({ (feeditem) in
            var episode = Episode(feedItem: feeditem)
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            episodes.append(episode)
        })
        return episodes
    }
}
