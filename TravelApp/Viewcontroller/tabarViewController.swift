//
//  tabarViewController.swift
//  TravelApp
//
//  Created by Toan on 7/16/20.
//  Copyright © 2020 Toan. All rights reserved.
//

import UIKit

class tabarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
      let Homevc = homeViewController()
        
     let flyVC  = flyViewController()
        let navigation = UINavigationController(rootViewController: flyVC)
        let hotelVC = hotelViewController()
        let hotelNvc = UINavigationController(rootViewController: hotelVC)
        let  profileVC = profileViewController()
        self.viewControllers = [Homevc,navigation,hotelNvc,profileVC]
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
