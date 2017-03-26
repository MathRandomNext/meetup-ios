//
//  PlaceData.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public class PlaceData {
    
    public func getNearby(placeType: PlaceType?) -> [PlaceProtocol] {
        return [PlaceProtocol]()
    }
    
    private lazy var placeTypeQueryString: [PlaceType:String] = {
        return [
            PlaceType.restaurant: "restaurant",
            PlaceType.cafe: "cafe",
            PlaceType.bar: "bar",
            PlaceType.casino: "casino",
            PlaceType.nightClub: "night_club"
        ]
    }()
}
