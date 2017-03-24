//
//  Location.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

public struct Location: LocationProtocol {
    
    public var latitude: Double
    public var longitude: Double
    public var name: String?
    public var city: String?
    public var state: String?
    public var thoroughfare: String?
    
    init(latitude: Double,
         longitude: Double,
         name: String? = nil,
         city: String? = nil,
         state: String? = nil,
         thoroughfare: String? = nil) {
        
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.city = city
        self.state = state
        self.thoroughfare = thoroughfare
    }
    
}
