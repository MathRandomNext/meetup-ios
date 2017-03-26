//
//  ResponseProtocol.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public protocol ResponseProtocol {
    
    var body: [String: Any]? { get set }
    
    var message: String? { get set }
    
    var statusCode: Int? { get set }
    
    var headers: [String: Any]? { get set }
    
}
