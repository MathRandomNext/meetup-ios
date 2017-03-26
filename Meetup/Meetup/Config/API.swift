//
//  API.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public final class API {
    
    private static let googleApiUrl = "https://maps.googleapis.com/maps/api"
    private static let googleApiKey = "AIzaSyCJX1sMGpv4p9Mpww85unBMQHrIr9VM2NM"
    
    private static let urlNearbyVenues = googleApiUrl + "/place/nearbysearch/json"
    
    public static func nearbySearchUrl(latitude: Double,
                                       longitude: Double,
                                       radius: Int = Constants.LocationOptions.Radius,
                                       placeType: String? = nil) -> String {
        
        var url = "\(urlNearbyVenues)?location=\(latitude),\(longitude)&radius=\(radius)&key=\(googleApiKey)"
        if let placeType = placeType {
            url.append("&type=\(placeType)")
        }
        return url
    }
}
