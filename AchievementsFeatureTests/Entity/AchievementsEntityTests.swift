//
//  AchievementsEntityTests.swift
//  AchievementsFeatureTests
//
//  Created by Marcus  Robinson on 12/15/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import XCTest

@testable import AchievementsFeature

class AchievementsEntityTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAchievementEntity() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let overview: Overview = Overview(title: "Testing Title")
        
        let achievement: Achievements = Achievements(achievementId: 1, level: "1", progress: 10, total: 50, imageUrl: "www.testUrl.com", accessible: true)
        let achievementArray: [Achievements] = [achievement]
        let achievementEntity: AchievementsEntity = AchievementsEntity(success: true, status: 200, overview: overview, achievements: achievementArray)
        
        XCTAssertTrue(achievementEntity.overview.title == "Testing Title")
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.achievementId == achievement.achievementId}))
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.level == achievement.level}))
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.progress == achievement.progress}))
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.total == achievement.total}))
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.imageUrl == achievement.imageUrl}))
        XCTAssertTrue(achievementEntity.achievements.contains(where: { $0.accessible == achievement.accessible}))
        XCTAssertTrue(achievementEntity.success == true)
        XCTAssertTrue(achievementEntity.status == 200)
        
        
    }

}
