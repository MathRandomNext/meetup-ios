import UIKit

class PlaceDetailsViewController: UIViewController
{
    internal var currentPlace: PlaceProtocol!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = currentPlace.name
    }
}
