//
//  LocationServiceProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public protocol LocationServiceProtocol {
    
    var delegate: LocationServiceDelegate? { get set }
    
}

public protocol LocationServiceDelegate {
    
    func locationService (_ service: LocationServiceProtocol, didUpdateLocation location: LocationProtocol)
    
    func locationService (_ service: LocationServiceProtocol, didFailWithError error: Error)
    
}
