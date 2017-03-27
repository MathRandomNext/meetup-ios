//
//  LocationProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

public protocol LocationProtocol
{
    var latitude: Double { get set }
    var longitude: Double { get set }
    var name: String? { get set }
    var locality: String? { get set }
    var thoroughfare: String? { get set }
    var subThoroughfare: String? { get set }
}
