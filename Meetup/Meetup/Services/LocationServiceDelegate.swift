//
//  LocationServiceDelegate.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/24/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public protocol LocationServiceDelegate {
    
    func locationService (_ service: LocationServiceProtocol, didUpdateLocation location: LocationProtocol)
    
    func locationService (_ service: LocationServiceProtocol, didFailWithError error: Error)
    
}
