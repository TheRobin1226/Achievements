//
//  AchievementTableViewCell.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/11/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import Foundation
import UIKit

class AchievementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var achievementImageView: UIImageView!
    @IBOutlet weak var levelNumber: UILabel!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var achievementProgressBar: UIProgressView!
    @IBOutlet weak var achievementTotalLabel: UILabel!
    @IBOutlet weak var achievementProgressLabel: UILabel!
    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        
        levelView.backgroundColor = UIColor(white: 1, alpha: 0.9)
        levelView.layer.cornerRadius = levelView.frame.size.width / 2
        levelView.clipsToBounds = true
        
        achievementImageView.translatesAutoresizingMaskIntoConstraints = false
        achievementImageView?.layer.cornerRadius = 16.0
        achievementImageView?.layer.masksToBounds = true
        
        // I really tried to match up the color on the progress bar, it was irritating me haha
        achievementProgressBar.tintColor = UIColor(red: 50.0/255.0, green: 205.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        achievementProgressBar.layer.cornerRadius = 6.5
        achievementProgressBar.clipsToBounds = true
        achievementProgressBar.layer.sublayers![1].cornerRadius = 6.5
        achievementProgressBar.subviews[1].clipsToBounds = true
    }
    
    func checkAccessibility(accessible: Bool) {
        if !accessible {
            achievementImageView?.layer.opacity = 0.4
            achievementProgressBar.layer.opacity = 0.4
            levelView.layer.opacity = 0.4
            achievementTotalLabel.layer.opacity = 0.4
            achievementProgressLabel.layer.opacity = 0.4
        }
    }
    
    func setAchievemntProgress(progress: Int, total: Int, animateProgressBar: Bool) {
        achievementProgressBar.setProgress(Float(progress) / Float(total), animated: animateProgressBar)
        achievementTotalLabel.text = "\(total)pts"
        achievementProgressLabel.text = "\(progress)pts"
    }
    
}
