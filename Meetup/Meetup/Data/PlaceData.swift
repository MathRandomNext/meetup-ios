//
//  PlaceData.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift

public class PlaceData {
    
    private let requester: RequesterProcol
    private let placeFactory: PlaceFactoryProtocol
    
    init(requester: RequesterProcol, placeFactory: PlaceFactoryProtocol) {
        self.requester = requester
        self.placeFactory = placeFactory
    }
    
    public func getNearby(latitude: Double,
                          longitude: Double,
                          radius: Int = Constants.LocationOptions.Radius,
                          placeType: PlaceType? = nil) -> Observable<PlaceProtocol> {
        
        var nearbyPlacesUrl: String!
        if let placeType = placeType {
            nearbyPlacesUrl = API.nearbySearchUrl(latitude: latitude,
                                                  longitude: longitude,
                                                  radius: radius,
                                                  placeType: placeTypeQueryString[placeType])
        } else {
            nearbyPlacesUrl = API.nearbySearchUrl(latitude: latitude, longitude: longitude, radius: radius)
        }
        
        return self.requester
            .get(nearbyPlacesUrl)
            .filter { $0.body != nil }
            .map { JSON($0.body!) }
            .map({ responseJSON in
                print(responseJSON)
                let results = responseJSON["results"]
                
                return Place()
            })
    }
    
    private lazy var placeTypeQueryString: [PlaceType: String] = {
        return [
            PlaceType.restaurant: "restaurant",
            PlaceType.cafe: "cafe",
            PlaceType.bar: "bar",
            PlaceType.casino: "casino",
            PlaceType.nightClub: "night_club"
        ]
    }()
}