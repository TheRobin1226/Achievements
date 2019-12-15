//
//  AchievementsInteractorTests.swift
//  AchievementsFeatureTests
//
//  Created by Marcus  Robinson on 12/15/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import XCTest
@testable import AchievementsFeature

class AchievementsInteractorTests: XCTestCase {
    
    var interactor: AchievementsInteractor!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.interactor = AchievementsInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.interactor = nil
    }

    func testFetchAchievemnts() {
        self.interactor.fetchAchievementsFromJSON()
        XCTAssertNotNil(self.interactor.achievementsEntity)
    }
}

