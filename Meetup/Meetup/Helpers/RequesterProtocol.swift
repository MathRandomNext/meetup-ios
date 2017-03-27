//
//  Requesting.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/22/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import RxSwift

public protocol RequesterProcol
{
    func get(_ url: String) -> Observable<ResponseProtocol>
}
