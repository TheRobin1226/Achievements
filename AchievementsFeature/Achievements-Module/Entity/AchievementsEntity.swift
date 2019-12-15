//
//  AchievementsModel.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation

struct AchievementsEntity: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievements]
}

struct Overview: Codable {
    let title: String
}

struct Achievements: Codable {
    let achievementId: Int
    let level: String
    let progress: Int
    let total: Int
    let imageUrl: String
    let accessible: Bool
    
    enum CodingKeys : String, CodingKey {
        case achievementId = "id"
        case level
        case progress
        case total
        case imageUrl = "bg_image_url"
        case accessible
    }
}
