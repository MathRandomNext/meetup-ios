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
                        locality: String?,
                        thoroughfare: String?,
                        subThoroughfare: String?) -> LocationProtocol
    
}

extension LocationFactoryProtocol {
    
    func createLocation(latitude: Double,
                        longitude: Double,
                        name: String? = nil,
                        locality: String? = nil,
                        thoroughfare: String? = nil,
                        subThoroughfare: String? = nil) -> LocationProtocol {
        
        return createLocation(latitude: latitude,
                              longitude: longitude,
                              name: name,
                              locality: locality,
                              thoroughfare: thoroughfare,
                              subThoroughfare: subThoroughfare)
    }
    
}
