import UIKit
import RxSwift

class PlaceDetailsViewController: UIViewController
{
    @IBOutlet weak var posterImageView: UIImageView!
    
    internal var placeData: PlaceDataProtocol!
    internal var currentPlace: PlaceProtocol!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = currentPlace.name
        self.startLoading()

        self.placeData
            .getById(placeId: self.currentPlace.id)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { placeDetails in
                let url = URL(string: placeDetails.photoUrl ?? Constants.Default.ImageUrl)!
                self.posterImageView.setImageFromUrl(imageUrl: url)
            }, onCompleted: { self.stopLoading() })
            .disposed(by: disposeBag)
    }
}
