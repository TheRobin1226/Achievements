//
//  AchievementsPresenter.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class AchievementsPresenter: AchievementsPresenterProtocol, AchievementsInteractorOutputProtocol {
 
    // AchievementsPresenterProtocol
    var view: AchievementsViewProtocol?
    
    var interactor: AchievementsInteractorInputProtocol?
    
    var router: AchievementsRouterProtocol?
    
    func startFetchingAchievements() {
        interactor?.fetchAchievementsFromJSON()
    }
    
    func startFetchingAchievementImage() {
        interactor?.fetchImagesFromJSON()
    }
    
    func presentAchievementViewController() {
        router?.presentAchievementModule()
    }
    
    // AchievementsInteractorOutputProtocol
    func achievementsFetchedSuccess(achievementsEntity: AchievementsEntity) {
        view?.saveAchievements(achievementsEntity: achievementsEntity)
    }
    
    func achievementsImagesFetchedSuccess(imagesArray: [UIImage]) {
        view?.showAchievements(imagesArray: imagesArray)
    }
    
    func achievementsFetchFailed(errorMessage: String) {
        view?.showError(message: errorMessage)
    }
    
    func achievementsImagesFetchFailed(errorMessage: String) {
        view?.showError(message: errorMessage)
    }
    
}
