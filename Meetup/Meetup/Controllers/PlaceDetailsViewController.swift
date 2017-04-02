import UIKit
import RxSwift
import Cosmos

class PlaceDetailsViewController: UIViewController
{
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeRating: CosmosView!
    @IBOutlet weak var placeType: UILabel!
    
    internal var placeData: PlaceDataProtocol!
    internal var currentPlace: PlaceProtocol!
    
    private var currentPlaceDetails: PlaceDetailsProtocol?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = currentPlace.name
        self.startLoading()
        self.loadData(onCompleted: { self.stopLoading() })
    }
    
    @IBAction func onCallButtonClick(_ sender: Any)
    {
        guard self.currentPlaceDetails?.phoneNumber != nil else
        {
            self.showInfo(withStatus: "Phone number not provided")
            return
        }
        
        let phoneNumber = (self.currentPlaceDetails?.phoneNumber)!
        
        if let dialUrl = URL(string: "telprompt://\(phoneNumber)")
        {
            UIApplication.shared.open(dialUrl, options: [:], completionHandler: nil)
        }
        else
        {
            self.showInfo(withStatus: "Phone number not provided")
        }
    }
    
    @IBAction func onBrowseButtonClick(_ sender: Any)
    {
        guard self.currentPlaceDetails?.websiteUrl != nil else
        {
            self.showInfo(withStatus: "Website not provided")
            return
        }
        
        let websiteUrl = (self.currentPlaceDetails?.websiteUrl)!
        
        if let websiteUrl = URL(string: websiteUrl)
        {
            UIApplication.shared.open(websiteUrl, options: [:], completionHandler: nil)
        }
        else
        {
            self.showInfo(withStatus: "Website not provided")
        }
    }
    
    private func loadData(onCompleted: @escaping () -> Void)
    {
        self.placeData
            .getById(placeId: self.currentPlace.id)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { placeDetails in
                self.currentPlaceDetails = placeDetails
                let url = URL(string: placeDetails.photoUrl ?? Constants.Default.ImageUrl)!
                self.posterImageView.setImageFromUrl(imageUrl: url)
                self.placeNameLabel.text = placeDetails.name
                self.placeRating.rating = Double(placeDetails.rating ?? 0)
                
                if let placeTypes = placeDetails.types
                {
                    self.placeType.text = placeTypes.count > 0 ? placeTypes[0] : nil
                }
            }, onCompleted: onCompleted)
            .disposed(by: disposeBag)
    }
}
