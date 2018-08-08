//
//  CarModel.swift
//  AutoTrader2
//
//  Created by Charlie Dill on 8/6/18.
//  Copyright © 2018 dill. All rights reserved.
//

import Foundation


class CarsModel {
    
    var vehicles = [Vehicle]()
    var selectedIndex = 0
    
    init() {
        
        
        let generator = VehiclesGenerator()
        self.vehicles = generator.vehicles
    }
}
