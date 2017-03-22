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
        
        defaultContainer.register(Requesting.self) { _ in Requester() }
    }
}
