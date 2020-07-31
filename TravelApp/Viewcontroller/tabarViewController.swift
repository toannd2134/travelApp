//
//  tabarViewController.swift
//  TravelApp
//
//  Created by Toan on 7/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class TabarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
      let Homevc = HomeViewController()
        Homevc.tabBarItem.image = UIImage(named: "home")
        Homevc.tabBarItem.title = "Du lich"
     let flyVC  = flyViewController()
        let navigation = UINavigationController(rootViewController: flyVC)
        navigation.tabBarItem.image = UIImage(named: "fly")
        navigation.tabBarItem.title  = "may bay"
        let hotelVC = hotelViewController()
        let hotelNvc = UINavigationController(rootViewController: hotelVC)
        hotelNvc.tabBarItem.image = UIImage(named: "hotel")
        hotelNvc.tabBarItem.title = "khach san"
        let  profileVC = profileViewController()
        let proFileNVC = UINavigationController(rootViewController: profileVC)
        proFileNVC.tabBarItem.image = UIImage(named: "profile")
        proFileNVC.tabBarItem.title = "ca nhan "
        
        self.viewControllers = [Homevc,navigation,hotelNvc,proFileNVC]
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
