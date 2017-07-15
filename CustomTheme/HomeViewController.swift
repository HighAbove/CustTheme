//
//  HomeViewController.swift
//  CustomTheme
//
//  Created by Semeon D on 7/11/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//

import UIKit

class HomeViewController: UINavigationController,UISearchBarDelegate {
   
    var currentPageController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.view.addSubview(searchBar)
        
        setupContentView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    //MARK: view components
    lazy var searchBar: UISearchBar = {
        let navHeight :CGFloat = self.navigationBar.frame.size.height
        let barItem = UISearchBar(frame: CGRect(x:0, y:0, width:300, height:20))
        //TODO: do something about the rotation
        barItem.layer.position = CGPoint(x: self.view.bounds.width/2, y: 40)
        barItem.placeholder = "Search ..."
        barItem.tintColor = UIColor.black
        barItem.barTintColor = Theme.mainColor
        return barItem
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    func setupContentView() {
        view.addSubview(contentView)
        
        //contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //contentView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        //contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
