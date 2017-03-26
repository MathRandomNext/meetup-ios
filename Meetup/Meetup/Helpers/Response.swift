//
//  Response.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public struct Response: ResponseProtocol {
    
    public var body: [String: Any]?
    
    public var message: String?
    
    public var statusCode: Int?
    
    public var headers: [String: Any]?
    
}
