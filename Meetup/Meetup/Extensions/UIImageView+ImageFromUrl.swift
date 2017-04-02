import Foundation
import Kingfisher

extension UIImageView
{
    func setImageFromUrl(imageUrl: URL)
    {
        // TODO: Start loading indicator
        
        self.kf.setImage(with: imageUrl, completionHandler:
            { (image, error, cacheType, imageUrl) in
                // TODO: Stop loading indicator
            })
    }
}
