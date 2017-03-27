//
//  Place.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

public struct Place: PlaceProtocol
{
    public var id: String
    public var name: String
    public var address: String?
    public var types: [String]?
    public var rating: Float?
    public var photoUrl: String?
}
