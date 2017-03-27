//
//  LocationFactory.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public struct LocationFactory: LocationFactoryProtocol
{
    public func createLocation(latitude: Double,
                               longitude: Double,
                               name: String? = nil,
                               locality: String? = nil,
                               thoroughfare: String? = nil,
                               subThoroughfare: String? = nil)
        -> LocationProtocol
    {
        return Location(latitude: latitude,
                        longitude: longitude,
                        name: name,
                        locality: locality,
                        thoroughfare: thoroughfare,
                        subThoroughfare: subThoroughfare)
    }
}
