//
//  LocationFactory.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public struct LocationFactory: LocationFactoryProtocol {
    
    public func createLocation(latitude: Double,
                               longitude: Double,
                               name: String? = nil,
                               city: String? = nil,
                               state: String? = nil,
                               thoroughfare: String? = nil) -> LocationProtocol {
        
        return Location(latitude: latitude,
                        longitude: longitude,
                        name: name,
                        city: city,
                        state: state,
                        thoroughfare: thoroughfare)
    }
    
}
