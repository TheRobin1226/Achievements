//
//  AchievementsRouter.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class AchievementsRouter: AchievementsRouterProtocol {
    
    class func presentAchievementsModule(fromView: AnyObject) {
        
        let view: AchievementsViewProtocol = AchievementsViewController.instantiate()
        
        let presenter: AchievementsPresenterProtocol & AchievementsInteractorOutputProtocol = AchievementsPresenter()
        let interactor: AchievementsInteractorInputProtocol = AchievementsInteractor()
        let router: AchievementsRouterProtocol = AchievementsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let viewController = view as! AchievementsViewController
        NavigationHelper.setRootViewController(withViewController: viewController)
        
    }
    
    func presentAchievementModule() {
        NavigationHelper.pushViewController()
    }
}
