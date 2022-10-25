//
//  Helper.swift
//  AuthFlow-3rpApp
//
//  Created by Oday Dieg on 03/07/2022.
//

import Foundation
import UIKit

class Helper: NSObject {
    class func skipAndGoToHome(){
           // MARK: go To home
        guard let window = UIApplication.shared.keyWindow else{return}
        let sb = UIStoryboard(name: StoryBoard.HomeStoryBoard, bundle: nil)
        var vc : UIViewController
        vc = sb.instantiateViewController(withIdentifier: TabBar.MainTabBar)
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .showHideTransitionViews, animations: nil, completion: nil)
    }

}
