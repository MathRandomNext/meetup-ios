//
//  PlaceProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

public protocol PlaceProtocol {
    
    var id: String { get set }
    var name: String { get set }
    var address: String? { get set }
    var types: [String]? { get set }
    var rating: Float? { get set }
    var photoUrl: String? { get set }
    
}

public enum PlaceType: Int {
    case restaurant = 1
    case cafe = 2
    case bar = 3
    case casino = 4
    case nightClub = 5
    case other = 6
}
