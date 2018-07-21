//
//  String.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/3/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
