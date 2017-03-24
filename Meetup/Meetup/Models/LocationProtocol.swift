//
//  LocationProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

public protocol LocationProtocol {
    
    var latitude: Double { get set }
    var longitude: Double { get set }
    var name: String? { get set }
    var city: String? { get set }
    var state: String? { get set }
    var thoroughfare: String? { get set }
    
}
