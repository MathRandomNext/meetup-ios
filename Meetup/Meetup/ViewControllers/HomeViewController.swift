//
//  HomeViewController.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/21/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, LocationServiceDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    var locationService: LocationServiceProtocol!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationService.delegate = self
        
//        Requester(responseFactory: ResponseFactory())
//            .get("https://telerik-meetup.herokuapp.com/user/ilievv")
//            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext:  { res in
//                print(res)
//            }, onError: { error in
//                print(error)
//            }, onDisposed: {
//                print("disposed")
//            }).disposed(by: disposeBag)
        
        PlaceData(requester: Requester(responseFactory: ResponseFactory()), placeFactory: PlaceFactory())
            .getNearby(latitude: 42.692923, longitude: 23.320057)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { print("-------\($0.name)") })
            .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onNavigationMenuItemClick(_ sender: UIButton) {
        let nearbyPlacesVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.NearbyViewController)
            as! NearbyViewController
        
        nearbyPlacesVC.placeType = PlaceType(rawValue: sender.tag)
        
        self.navigationController?.show(nearbyPlacesVC, sender: self)
    }
    
    func locationService(_ service: LocationServiceProtocol, didUpdateLocation location: LocationProtocol) {
        self.setTitle(location: location)
    }
    
    func locationService(_ service: LocationServiceProtocol, didFailWithError error: Error) {
        self.clearTitle()
    }
    
    private func setTitle(location: LocationProtocol) {
        var title: String?
        var subtitle: String?
        
        func createSecondaryTitle(_ location: LocationProtocol) -> String? {
            var subtitle: String?
            
            let locationLocality = location.locality ?? ""
            let locationThoroughfare = location.thoroughfare ?? ""
            let locationSubThoroughfare = location.subThoroughfare ?? ""
            
            if !locationLocality.isEmpty {
                subtitle = locationLocality
            }
            
            if !locationThoroughfare.isEmpty && (subtitle ?? "").isEmpty {
                subtitle = "\(locationThoroughfare) \(locationSubThoroughfare)"
            } else if !locationThoroughfare.isEmpty && (subtitle ?? "").isEmpty {
                subtitle! += ", \(locationThoroughfare) \(locationSubThoroughfare)"
            }
            
            return subtitle
        }
        
        let locationName = location.name ?? ""
        
        if locationName.isEmpty {
            title = createSecondaryTitle(location)
        } else {
            title = locationName
            subtitle = createSecondaryTitle(location)
        }
        
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
    
    private func clearTitle() {
        self.titleLabel.text = "Unknown location"
        self.subtitleLabel.text = nil
    }
}
