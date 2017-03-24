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
