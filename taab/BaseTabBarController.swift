//
//  BaseTabBarController.swift
//  taab
//
//  Created by kiran on 9/3/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
       UITabBar.appearance().tintColor = UIColor.orange
//       UITabBar.tabBarItem.setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.cyan], for: .normal)
//        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .normal)
//        tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
      //  tabBarItem.setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.green], for:.selected)
//        let v1 = UINavigationController(rootViewController: UIViewController())
//        let v2 = UINavigationController(rootViewController: UIViewController())
//          let v3 = UINavigationController(rootViewController: UIViewController())
//        
//        v1.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
//        v2.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
//        v3.tabBarItem = UITabBarItem(title: "Home", image: nil, selectedImage: nil)
//        
//        self.viewControllers = [v1, v2, v3]
//        self.hidesBottomBarWhenPushed = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

