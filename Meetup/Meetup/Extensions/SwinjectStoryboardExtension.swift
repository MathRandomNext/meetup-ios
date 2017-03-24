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
        
        defaultContainer.register(Requesting.self) { _ in Requester() }
        defaultContainer.register(LocationServiceProtocol.self) { r in
            LocationService(locationFactory: r.resolve(LocationFactoryProtocol.self)!)
        }
        
        defaultContainer.register(LocationFactoryProtocol.self) { _ in LocationFactory() }
    }
}
