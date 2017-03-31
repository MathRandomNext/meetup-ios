import Foundation
import Kingfisher

extension UIImageView
{
    func setImageFromUrl(imageUrl: URL)
    {
        self.kf.setImage(with: imageUrl)
    }
}
