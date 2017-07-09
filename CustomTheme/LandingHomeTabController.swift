//
//  HomeTabViewController.swift
//  CustomTheme
//
//  Created by Semeon D on 7/8/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//

import UIKit

class LandingHomeTabController: UIViewController {
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = UIColor.white
        view.backgroundColor = Theme.mainColor
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupContentView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupContentView() {
        view.addSubview(contentView)
        
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
