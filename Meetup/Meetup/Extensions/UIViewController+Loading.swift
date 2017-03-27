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
