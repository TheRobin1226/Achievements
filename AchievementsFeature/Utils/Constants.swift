//
//  Constants.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/13/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation

struct Constants {
    
    struct errorMessages {
        static let imagesFetchingError = "Couldn't Fetch Images"
        static let achievementsFetchingError = "Couldn't Fetch Achievements"
    }
    
    struct fileTypes {
        struct json {
            static let name = "achievements"
            static let ext = "json"
        }
        struct img {
            static let iconImg = "info icon"
            static let backBtnImg = "backBtn"
            static let emptyImg = "ImageComingSoon"
        }
    }
}
