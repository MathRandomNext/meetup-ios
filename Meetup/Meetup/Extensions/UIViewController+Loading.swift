//
//  File.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/27/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

extension UIViewController
{
    func startLoading()
    {
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoading()
    {
        SVProgressHUD.dismiss()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
