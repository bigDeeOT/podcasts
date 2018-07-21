//
//  Episode.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/3/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String
    var imageUrl: String?
    let author: String
    let streamUrl: String
    
    init (feedItem: RSSFeedItem) {
        streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        title = feedItem.title ?? ""
        pubDate = feedItem.pubDate ?? Date()
        description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href
        author = feedItem.iTunes?.iTunesAuthor ?? ""
    }
}
