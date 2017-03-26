//
//  ResponseFactory.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/26/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation

public class ResponseFactory: ResponseFactoryProtocol {
    
    public func createResponse() -> ResponseProtocol {
        return Response()
    }
}
