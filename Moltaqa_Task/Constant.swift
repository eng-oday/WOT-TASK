//
//  Constant.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import Foundation
import UIKit

enum StoryBoard {
    static let Auth                             = "Auth"
    static let HomeStoryBoard                   = "HomeStoryBoard"
    static let More                             = "More"
}

enum TabBar {
    static let MainTabBar                        = "MainTabBar"
}


enum ViewControllers{
    static let LoginViewControllerVC            = "LoginViewController"
    static let HomeViewController               = "HomeViewController"
    static let changeStatusViewController       = "changeStatusViewController"
    static let MoreViewController               = "MoreViewController"
    static let ProfileViewController            = "ProfileViewController"


}

enum NavigationController {
static let HomeNavigation                       = "HomeNavigation"
}

enum Cell{
    static let HomeTableViewCell                = "HomeTableViewCell"
    static let SettingsTableViewCell            = "SettingsTableViewCell"
}

enum staticData {
    
    static let SettingModel:[settingsModel] = [
        settingsModel(image: UIImage(named: "Hicon - Bold - Profile Remove 2")!, text: "My Profile"),
    settingsModel(image: UIImage(named: "Hicon - Bold - Notification 1")!, text: "Notification setting"),
    settingsModel(image: UIImage(named: "Icon material-location-on")!, text: "Geofences"),
    settingsModel(image: UIImage(named: "Icon material-bluetooth")!, text: "Beacons"),
    settingsModel(image: UIImage(named: "Group 51529")!, text: "Active Hours"),
    settingsModel(image: UIImage(named: "Hicon - Bold - Document Align Center 1")!, text: "Check History"),
    settingsModel(image: UIImage(named: "calendar")!, text: "My Schedule"),
    settingsModel(image: UIImage(named: "Hicon - Bold - Call")!, text: "Contact Us"),
    settingsModel(image: UIImage(named: "Hicon - Bold - Like 1")!, text: "Request"),
    settingsModel(image: UIImage(named: "language")!, text: "Change Language"),
    settingsModel(image: UIImage(named: "login")!, text: "Logout"),

    ]
    
    
    
    
    
    
}
