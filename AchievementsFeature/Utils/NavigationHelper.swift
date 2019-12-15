//
//  NavigationHelper.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/12/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class NavigationHelper {
    
    static func setRootViewController(withViewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: withViewController)
        setupNavigationController(navigationController: navigationController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate.window?.rootViewController = navigationController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    static func pushViewController() {
        /*
         I was thinking that if you click on the achievement, you can maybe move to the next screen.
         Since I only saw one screen, I will print that the achievement was clicked
        */
        print("Achievement is accessible")
    }
    
    private static func setupNavigationController(navigationController: UINavigationController) {
        
        let navBar = navigationController.navigationBar
        
        /*
           I did this mainly because this might run on other versions and
           systemIndigo was only available on iOS 13. I wanted to match the design
           as much as possible so I got the RGB of indigo online :D
        */
        
        if #available(iOS 13.0, *) {
            navBar.barTintColor = UIColor.systemIndigo
        } else {
            // Fallback on earlier versions
            navBar.barTintColor = UIColor(red: 94.0/255.0, green: 92.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        }
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
