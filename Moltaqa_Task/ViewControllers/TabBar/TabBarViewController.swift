//
//  TabBarViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addLineOnTop()
    }
    
    
    
    private func addLineOnTop(){
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width:self.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.systemGray4
       // self.tabBar.layer.borderWidth = 1
       // self.tabBar.layer.borderColor   = UIColor.red.cgColor
        self.tabBar.addSubview(lineView)
    }
    

    

}
