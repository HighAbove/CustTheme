//
//  HomeViewController.swift
//  CustomTheme
//
//  Created by Semeon D on 7/8/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//

import UIKit

class LandingViewController: UITabBarController {
    
    //MARK: tab bar properties
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
    
    //MARK: define the navigation controllers
    lazy var homeController: HomeViewController = {
        let controller = HomeViewController()
        controller.navigationBar.barTintColor = Theme.mainColor
        let icon = UIImage(named:"HomeFilled")
        let tabItem = UITabBarItem(title: "HOME", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tabItem.titlePositionAdjustment = UIOffsetMake(0,-5)
        controller.tabBarItem = tabItem
        return controller
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //append the view that contains the tab bar item in viewControllers
        viewControllers = [homeController, createVC(iconName:"HeartFilled", title:"FAVORITES"), createVC(iconName: "MessageFilled", title: "MESSAGE")]
        
        setupTab()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: show status bar. Need to modify info.plist
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return selectedViewController?.preferredStatusBarUpdateAnimation ?? .fade
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
    override var prefersStatusBarHidden: Bool {
        return selectedViewController?.prefersStatusBarHidden ?? false
    }
    
    //use this template function to create multiple UIViewControllers
    private func createVC(iconName:String, title:String) -> UINavigationController{
        let controller  = UINavigationController()
        controller.navigationBar.barTintColor = Theme.mainColor
        let icon = UIImage(named:iconName)
        let tabItem = UITabBarItem(title: title, image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tabItem.titlePositionAdjustment = UIOffsetMake(0,-5)
        controller.tabBarItem = tabItem
        return controller
    }
    
    //tab bar separator
    var tabBarSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    //MARK: Tab bar appearance
    func setupTab() {
        tabBar.clipsToBounds = true // hide default top border
        tabBar.addSubview(tabBarSeparator)
        
        tabBarSeparator.widthAnchor.constraint(equalTo: tabBar.widthAnchor).isActive = true
        tabBarSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        tabBarSeparator.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        tabBarSeparator.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        
        //tab appearance
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
