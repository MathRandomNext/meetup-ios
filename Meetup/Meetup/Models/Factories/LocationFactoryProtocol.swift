//
//  LocationFactoryProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public protocol LocationFactoryProtocol {
    
    func createLocation(latitude: Double,
                        longitude: Double,
                        name: String?,
                        city: String?,
                        state: String?,
                        thoroughfare: String?) -> LocationProtocol
    
}

extension LocationFactoryProtocol {
    
    func createLocation(latitude: Double,
                        longitude: Double,
                        name: String? = nil,
                        city: String? = nil,
                        state: String? = nil,
                        thoroughfare: String? = nil) -> LocationProtocol {
        
        return createLocation(latitude: latitude, longitude: longitude, name: name, city: city, state: state, thoroughfare: thoroughfare)
    }
    
}
