//
//  AchievementsProtocols.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

// View -> Presenter
protocol AchievementsPresenterProtocol: class {
    
    var view: AchievementsViewProtocol? { get set }
    var interactor: AchievementsInteractorInputProtocol? { get set }
    var router: AchievementsRouterProtocol? { get set }
    func startFetchingAchievements()
    func startFetchingAchievementImage()
    func presentAchievementViewController()
    
}

// Presenter -> View
protocol AchievementsViewProtocol: class {
    var presenter: AchievementsPresenterProtocol? { get set }
    func saveAchievements(achievementsEntity: AchievementsEntity)
    func showAchievements(imagesArray: [UIImage])
    func showError(message: String)
}

// Presenter -> Router
protocol AchievementsRouterProtocol: class {
    static func presentAchievementsModule(fromView: AnyObject)
    func presentAchievementModule()
}

// Presenter -> Interactor
protocol AchievementsInteractorInputProtocol: class {
    var presenter: AchievementsInteractorOutputProtocol? { get set }
    func fetchAchievementsFromJSON()
    func fetchImagesFromJSON()
}

// Interactor -> Presenter
protocol AchievementsInteractorOutputProtocol: class {
    func achievementsFetchedSuccess(achievementsEntity: AchievementsEntity)
    func achievementsImagesFetchedSuccess(imagesArray: [UIImage])
    func achievementsImagesFetchFailed(errorMessage: String)
    func achievementsFetchFailed(errorMessage: String)
}
