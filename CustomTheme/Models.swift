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
        firstHome.location = "Los Angeles, CA"
        firstHome.price = 800
        
        homes.append(firstHome)
        
        let secondHome = Home()
        secondHome.type = "Whole House"
        secondHome.location = "Los Angeles, CA"
        secondHome.price = 1200
        
        homes.append(secondHome)
        homeCategory.homes = homes
        
        var services = [Home]()
        
        let serviceCategory = 	HomeCategory()
        serviceCategory.name = "Services"
        
        let firstService = Home()
        firstService.location = "Los Angeles, CA"
        firstService.type = "Automobile Repair"
        
        services.append(firstService)
        serviceCategory.homes = services
        
        return [homeCategory, serviceCategory]
    }
}

class Home: NSObject{
    var id: NSNumber?
    var type: String?
    var location: String?
    var price: NSNumber?
}
