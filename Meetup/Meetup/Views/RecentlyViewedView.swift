import UIKit

class RecentlyViewedView: UIView
{
    @IBOutlet var view: UIView!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        UINib(nibName: "RecentlyViewedView", bundle: nil)
            .instantiate(withOwner: self, options: nil)
        
        self.addSubview(view)
        view.frame = self.bounds
    }
}
