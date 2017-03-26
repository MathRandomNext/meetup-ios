//
//  PlaceFactoryProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public protocol PlaceFactoryProtocol {
    
    func createPlace(id: String,
                     name: String,
                     address: String?,
                     types: [String]?,
                     rating: Float?,
                     photoUrl: String?) -> PlaceProtocol
    
}

extension PlaceFactoryProtocol {
    
    func createPlace(id: String,
                     name: String,
                     address: String? = nil,
                     types: [String]? = nil,
                     rating: Float? = nil,
                     photoUrl: String? = nil) -> PlaceProtocol {
        
        return createPlace(id: id, name: name, address: address, types: types, rating: rating, photoUrl: photoUrl)
    }
    
}
