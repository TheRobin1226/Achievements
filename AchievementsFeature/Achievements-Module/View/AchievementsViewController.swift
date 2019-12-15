//
//  AchievementsViewController.swift
//  AchievementsFeature
//
//  Created by Marcus  Robinson on 12/10/19.
//  Copyright © 2019 Marcus  Robinson. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    @IBOutlet weak var achievementsTableView: UITableView!
    
    var presenter: AchievementsPresenterProtocol?
    var achievementsEntity: AchievementsEntity?
    var achievementsArray: [Achievements] = []
    var achievementImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        presenter?.startFetchingAchievements()
        
        // setup UITableView
        self.title = self.achievementsEntity?.overview.title
        achievementsTableView.delegate = self
        
        // setup navigation bar images
        setLeftButtonBarItem()
        setRightButtonBarItem()
    }
    
    static func instantiate() -> AchievementsViewProtocol {
        return UIStoryboard(name: "Achievements", bundle: nil).instantiateViewController(withIdentifier: "AchievementsViewController") as! AchievementsViewController
    }
    
    // MARK: Navigation Item Images
    
    /*
     I set these buttons because the images that were provided by Xcode itself were not available prior to iOS 13.
     If they were, these functions were not needed at all. Super sorry about the extra code :(
     */
    func setLeftButtonBarItem() {
        let image = UIImage(named: Constants.fileTypes.img.backBtnImg)!.withRenderingMode(.alwaysOriginal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
    }
    
    func setRightButtonBarItem() {
        let image = UIImage(named: Constants.fileTypes.img.iconImg)!.withRenderingMode(.alwaysOriginal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
    }
}

// MARK: AchievementsViewProtocol
extension AchievementsViewController: AchievementsViewProtocol {
    
    func saveAchievements(achievementsEntity: AchievementsEntity) {
        self.achievementsEntity = achievementsEntity
        self.achievementsArray = achievementsEntity.achievements
        self.presenter?.startFetchingAchievementImage()
    }
    
    func showAchievements(imagesArray: [UIImage]) {
        self.achievementImages = imagesArray
        achievementsTableView.dataSource = self
        self.achievementsTableView.reloadData()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: UITableViewDelegate, UITableViewDataSource
extension AchievementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementTableViewCell", for: indexPath) as! AchievementTableViewCell
        
        cell.achievementImageView.image = self.achievementImages[indexPath.row]
        cell.levelNumber.text = self.achievementsArray[indexPath.row].level
        cell.setAchievemntProgress(progress: self.achievementsArray[indexPath.row].progress, total: self.achievementsArray[indexPath.row].total, animateProgressBar: false)
        cell.checkAccessibility(accessible: self.achievementsArray[indexPath.row].accessible)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.achievementsArray[indexPath.row].accessible {
           presenter?.presentAchievementViewController()
        }
    }
    
}
