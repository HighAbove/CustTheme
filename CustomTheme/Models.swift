//
//  Models.swift
//  CustomTheme
//
//  Created by Semeon D on 7/15/17.
//  Copyright © 2017 Semeon D. All rights reserved.
//
import UIKit

class HomeCategory: NSObject {
    var name: String?
    var homes: [Home]?
    
    static func sampleHomeCategories() -> [HomeCategory]{
        let homeCategory = 	HomeCategory()
        homeCategory.name = "Homes For Rent"
        
        var homes = [Home]()
        
        let firstHome = Home()
        firstHome.type = "Single Room"
        firstHome.location = "12556 Custom Street, Los Angeles, CA"
        firstHome.price = 800
        
        homes.append(firstHome)
        
        homeCategory.homes = homes
        return [homeCategory]
    }
}

class Home: NSObject{
    var id: NSNumber?
    var type: String?
    var location: String?
    var price: NSNumber?
}
