//
//  SwinjectStoryboardExtension.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard
{
    class func setup()
    {
        Container.loggingFunction = nil
        
        setupViewConrollers(defaultContainer)
        setupServices(defaultContainer)
        setupHelpers(defaultContainer)
        setupData(defaultContainer)
        setupFactories(defaultContainer)
    }
}

private func setupViewConrollers(_ defaultContainer: Container)
{
    defaultContainer.storyboardInitCompleted(HomeViewController.self)
    { (r, c) in
        c.locationService = r.resolve(LocationServiceProtocol.self)
    }
    
    defaultContainer.storyboardInitCompleted(NearbyViewController.self)
    { (r, c) in
        c.placeData = r.resolve(PlaceDataProtocol.self)
    }
}

private func setupServices(_ defaultContainer: Container)
{
    defaultContainer.register(LocationServiceProtocol.self)
    { r in
        LocationService(locationFactory: r.resolve(LocationFactoryProtocol.self)!)
    }
}

private func setupHelpers(_ defaultContainer: Container)
{
    defaultContainer.register(RequesterProcol.self)
    { r in
        Requester(responseFactory: r.resolve(ResponseFactoryProtocol.self)!)
    }
}

private func setupData(_ defaultContainer: Container)
{
    defaultContainer.register(PlaceDataProtocol.self)
    { r in
        PlaceData(requester: r.resolve(RequesterProcol.self)!, placeFactory: r.resolve(PlaceFactoryProtocol.self)!)
    }
}

private func setupFactories(_ defaultContainer: Container)
{
    defaultContainer.register(ResponseFactoryProtocol.self) { _ in ResponseFactory() }
    defaultContainer.register(LocationFactoryProtocol.self) { _ in LocationFactory() }
    defaultContainer.register(PlaceFactoryProtocol.self) { _ in PlaceFactory() }
}
