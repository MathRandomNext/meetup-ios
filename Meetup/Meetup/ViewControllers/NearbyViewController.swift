//
//  NearbyViewController.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/21/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import Cosmos

class NearbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var nearbyPlacesTableView: UITableView!
    
    var placeData: PlaceDataProtocol!
    
    var currentLocation: LocationProtocol?
    var placeType: PlaceType?
    
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
