//
//  CMTime.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/4/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import Foundation
import AVKit

extension CMTime {
    func toDisplayString() -> String {
        guard self.isIndefinite == false else {return "--"}
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
}
