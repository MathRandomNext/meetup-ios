import Foundation
import SwiftyJSON
import RxSwift

public class PlaceData: PlaceDataProtocol
{
    private let requester: RequesterProcol
    private let placeFactory: PlaceFactoryProtocol
    
    init(requester: RequesterProcol, placeFactory: PlaceFactoryProtocol)
    {
        self.requester = requester
        self.placeFactory = placeFactory
    }
    
    public func getNearby(latitude: Double,
                          longitude: Double,
                          radius: Int = Constants.LocationOptions.Radius,
                          placeType: PlaceType? = nil)
        -> Observable<PlaceProtocol>
    {
        var nearbyPlacesUrl: String!
        if let placeType = placeType
        {
            nearbyPlacesUrl = API.nearbySearchUrl(latitude: latitude,
                                                  longitude: longitude,
                                                  radius: radius,
                                                  placeType: placeTypeQueryString[placeType])
        }
        else
        {
            nearbyPlacesUrl = API.nearbySearchUrl(latitude: latitude, longitude: longitude, radius: radius)
        }
        
        return self.requester
            .get(nearbyPlacesUrl)
            .filter { $0.body != nil }
            .flatMap { Observable.from(JSON($0.body!)["results"].arrayValue) }
            .map { placeJSON in
                let id = placeJSON["place_id"].stringValue
                let name = placeJSON["name"].stringValue
                let address = placeJSON["vicinity"].string
                let types = placeJSON["types"].arrayValue.map {
                    "\($0)".replacingOccurrences(of: "_", with: " ")
                }
                let rating = placeJSON["rating"].float
                
                return self.placeFactory
                    .createPlace(id: id, name: name, address: address, types: types, rating: rating)
            }
            .filter { $0 != nil }
            .map { $0! }
    }
    
    public func getDetails(placeId: String) -> Observable<PlaceDetailsProtocol>
    {
        return self.requester
            .get(API.placeDetailsUrl(placeId: placeId))
            .map {
                print($0)
                return self.placeFactory.createPlaceDetails()
            }
    }
    
    private lazy var placeTypeQueryString: [PlaceType: String] =
    {
        return [
            PlaceType.restaurant: "restaurant",
            PlaceType.cafe: "cafe",
            PlaceType.bar: "bar",
            PlaceType.casino: "casino",
            PlaceType.nightClub: "night_club"
        ]
    }()
}
