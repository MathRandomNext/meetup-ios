//
//  SwinjectStoryboardExtension.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        Container.loggingFunction = nil
        
        defaultContainer.storyboardInitCompleted(HomeViewController.self) { (r, c) in
            c.locationService = r.resolve(LocationServiceProtocol.self)
        }
        
        defaultContainer.register(RequesterProcol.self) { r in
            Requester(responseFactory: r.resolve(ResponseFactoryProtocol.self)!)
        }
        
        defaultContainer.register(LocationServiceProtocol.self) { r in
            LocationService(locationFactory: r.resolve(LocationFactoryProtocol.self)!)
        }
        
        defaultContainer.register(ResponseFactoryProtocol.self) { _ in ResponseFactory() }
        defaultContainer.register(LocationFactoryProtocol.self) { _ in LocationFactory() }
    }
}
