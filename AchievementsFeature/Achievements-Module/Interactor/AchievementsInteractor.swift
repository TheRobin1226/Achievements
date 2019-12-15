//
//  AchievementsInteractor.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class AchievementsInteractor: AchievementsInteractorInputProtocol {
    
    var presenter: AchievementsInteractorOutputProtocol?
    
    var achievementsEntity: AchievementsEntity?
    
    func fetchImagesFromJSON() {
        var imagesArray: [UIImage] = []
        
        for achievement in self.achievementsEntity!.achievements {
            if let url = URL(string: achievement.imageUrl) {
                do {
                    let data = try Data(contentsOf: url)
                    imagesArray.append(UIImage(data: data)!)
                } catch {
                    imagesArray.append(UIImage(named: Constants.fileTypes.img.emptyImg)!)
                }
            } else {
                imagesArray.append(UIImage(named: Constants.fileTypes.img.emptyImg)!)
            }
        }
        
        /*
            I was trying to figure out a cleaner way for this but I basically added a placeholder image
            just in case there was an empty/invalid url. No matter what, the imageArray will not
            be null. However, anything can happen so I added the fetchFailed function anyway
        */
        if imagesArray.count > 0 {
            self.presenter?.achievementsImagesFetchedSuccess(imagesArray: imagesArray)
        } else {
            self.presenter?.achievementsImagesFetchFailed(errorMessage: Constants.errorMessages.imagesFetchingError)
        }
    }
    
    func fetchAchievementsFromJSON() {
        if let url = Bundle.main.url(forResource: Constants.fileTypes.json.name, withExtension: Constants.fileTypes.json.ext) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(AchievementsEntity.self, from: data)
                self.achievementsEntity = jsonData
                self.presenter?.achievementsFetchedSuccess(achievementsEntity: jsonData)
            } catch {
                self.presenter?.achievementsFetchFailed(errorMessage: Constants.errorMessages.achievementsFetchingError)
            }
        }
    }
    
}
