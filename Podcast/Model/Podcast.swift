//
//  Podcast.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 6/22/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}
