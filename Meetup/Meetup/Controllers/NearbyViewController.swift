import Foundation
import UIKit
import RxSwift
import Cosmos

class NearbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var nearbyPlacesTableView: UITableView!
    
    internal var placeData: PlaceDataProtocol!
    
    internal var currentLocation: LocationProtocol?
    internal var placeType: PlaceType?
    
    private let disposeBag = DisposeBag()
    private var nearbyPlaces = [PlaceProtocol]()
    {
        didSet
        {
            self.nearbyPlacesTableView.reloadData()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.nearbyPlacesTableView.delegate = self
        self.nearbyPlacesTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        guard self.currentLocation != nil else
        {
            return
        }
        
        self.startLoading()
        
        self.placeData
            .getNearby(latitude: self.currentLocation!.latitude,
                       longitude: self.currentLocation!.longitude,
                       radius: Constants.LocationOptions.Radius,
                       placeType: self.placeType)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { self.nearbyPlaces.append($0) },
                       onCompleted: { self.stopLoading() })
            .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.nearbyPlaces.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let placeCell = self.nearbyPlacesTableView
            .dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath)
            as! PlaceTableViewCell
        
        let currentPlace = self.nearbyPlaces[indexPath.row]
        placeCell.placeTitle.text = currentPlace.name
        placeCell.placeTypes.text = currentPlace.types?.joined(separator: ", ")
        placeCell.placeAddress.text = currentPlace.address
        
        if let rating = currentPlace.rating
        {
            placeCell.placeRating.rating = Double(rating)
        }
        
        return placeCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        var numOfSections = 0
        
        if !self.nearbyPlaces.isEmpty
        {
            tableView.separatorStyle = .singleLine
            numOfSections = 1
            tableView.backgroundView = nil
        }
        else
        {
            let noDataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text = "No data available"
            noDataLabel.textColor = UIColor.darkGray
            noDataLabel.textAlignment = .center
            tableView.backgroundView = noDataLabel
            tableView.separatorStyle = .none
        }
        
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let placeAtIndexPath = self.nearbyPlaces[indexPath.row]
        
        let placeDetailsVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.PlaceDetailsViewController)
            as! PlaceDetailsViewController
        
        placeDetailsVC.currentPlace = placeAtIndexPath
        self.navigationController?.show(placeDetailsVC, sender: self)
    }
}

class PlaceTableViewCell: UITableViewCell
{
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeTypes: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var placeRating: CosmosView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
