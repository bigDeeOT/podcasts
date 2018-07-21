//
//  UIApplication.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/16/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import UIKit

extension UIApplication {
    static func mainTabBarController() -> MainTabBarController? {
        return shared.keyWindow?.rootViewController as? MainTabBarController
    }
}
