import UIKit
import Cosmos

class RecentlyViewedView: UIView
{
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var firstCellImage: UIImageView!
    @IBOutlet weak var firstCellTitle: UILabel!
    @IBOutlet weak var firstCellRating: CosmosView!
    
    @IBOutlet weak var secondCellImage: UIImageView!
    @IBOutlet weak var secondCellTitle: UILabel!
    @IBOutlet weak var secondCellRating: CosmosView!
    
    @IBOutlet weak var thirdCellImage: UIImageView!
    @IBOutlet weak var thirdCellTitle: UILabel!
    @IBOutlet weak var thirdCellRating: CosmosView!
    
    private var placeData: PlaceData!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        UINib(nibName: "RecentlyViewedView", bundle: nil)
            .instantiate(withOwner: self, options: nil)
        
        self.addSubview(view)
        view.frame = self.bounds
        
        self.placeData = PlaceData(
            requester: Requester(responseFactory: ResponseFactory()),
            coreData: CoreDataWrapper(),
            placeFactory: PlaceFactory())
        
        self.loadData()
    }
    
    public func reloadData()
    {
        self.loadData()
    }
    
    private var images: [UIImageView]
    {
        get
        {
            return [firstCellImage, secondCellImage, thirdCellImage]
        }
    }
    
    private var titles: [UILabel]
    {
        get
        {
            return [firstCellTitle, secondCellTitle, thirdCellTitle]
        }
    }
    
    private var ratingBars: [CosmosView]
    {
        get
        {
            return [firstCellRating, secondCellRating, thirdCellRating]
        }
    }
    
    private func loadData()
    {
        let recentPlaces = self.placeData.getRecent()
        
        for i in 0..<recentPlaces.count
        {
            let currentPlace = recentPlaces[i]
            let imageUrl = URL(string: currentPlace.photoUrl ?? Constants.Default.ImageUrl)!
            images[i].setImageFromUrl(imageUrl: imageUrl)
            titles[i].text = currentPlace.name
            ratingBars[i].rating = Double(currentPlace.rating)
        }
    }
}
