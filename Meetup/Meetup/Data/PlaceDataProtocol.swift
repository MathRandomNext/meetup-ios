//
//  PlaceDataProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import RxSwift

public protocol PlaceDataProtocol
{
    func getNearby(latitude: Double,
                   longitude: Double,
                   radius: Int,
                   placeType: PlaceType?)
        -> Observable<PlaceProtocol>
}

extension PlaceDataProtocol
{
    func getNearby(latitude: Double,
                   longitude: Double,
                   radius: Int = Constants.LocationOptions.Radius,
                   placeType: PlaceType? = nil)
        -> Observable<PlaceProtocol>
    {
        return getNearby(latitude: latitude, longitude: longitude, radius: radius, placeType: placeType)
    }
    
}
