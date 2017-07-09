//
//  HomeViewController.swift
//  CustomTheme
//
//  Created by Semeon D on 7/8/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//

import UIKit

class LandingViewController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK: tab bar properties
    //var tabBarHeight: CGFloat = 60
    var tabBarTextAttributesNormal = [NSFontAttributeName: UIFont.systemFont(ofSize: 8), NSForegroundColorAttributeName: UIColor.black]
    var tabBarTextAttributesSelected = [NSFontAttributeName: UIFont.systemFont(ofSize: 8), NSForegroundColorAttributeName: Theme.mainColor]
    /*
    var tabBarSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    */
    
    //MARK: declare tab bar item
    var homeTabItem: UITabBarItem = {
        let icon =  UIImage(named: "HomeFilled")
        let tab = UITabBarItem(title: "HOME", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffsetMake(0,-5)
        return tab
    }()
    
    var favTabItem: UITabBarItem = {
        let icon =  UIImage(named: "HeartFilled")
        let tab = UITabBarItem(title: "FAVORITES", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffsetMake(0,-5)
        return tab
    }()
    
    var msgTabItem: UITabBarItem = {
        let icon =  UIImage(named: "MessageFilled")
        let tab = UITabBarItem(title: "MESSAGE", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffsetMake(0,-5)
        return tab
    }()
    
    //MARK: declare the tab view controllers
    //FIXME: replace UIViewController with LandingHomeTabController() and remove this comment
    lazy var homeController: UIViewController = {
        //let controller = LandingHomeTabController()
        let controller = UIViewController()
        controller.tabBarItem = self.homeTabItem
        return controller
    }()
    //FIXME: replace UIViewController with LandingFavoriteTabController() and remove this comment
    lazy var favoriteController: UIViewController = {
        //let controller = LandingHomeTabController()
        let controller = UIViewController()
        controller.tabBarItem = self.favTabItem
        return controller
    }()
    //FIXME: replace UIViewController with LandingFavoriteTabController() and remove this comment
    lazy var messageController: UIViewController = {
        //let controller = LandingHomeTabController()
        let controller = UIViewController()
        controller.tabBarItem = self.msgTabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeController, favoriteController, messageController]
        delegate = self
        
        setupTabBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: setup the Tab bar
    func setupTabBar() {
        
        // add separator line
        //tabBar.clipsToBounds = true // hide default top border
        //tabBar.addSubview(tabBarSeparator)
        
        //tabBarSeparator.widthAnchor.constraint(equalTo: tabBar.widthAnchor).isActive = true
        //tabBarSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //tabBarSeparator.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        //tabBarSeparator.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        
        tabBar.tintColor = Theme.mainColor
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes(tabBarTextAttributesNormal, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(tabBarTextAttributesSelected,for: .selected)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
