//
//  SwinjectStoryboardExtension.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.register(Requesting.self) { _ in Requester() }
    }
}
