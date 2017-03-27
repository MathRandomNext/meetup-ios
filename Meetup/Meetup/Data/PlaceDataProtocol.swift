import Foundation
import RxSwift

public protocol PlaceDataProtocol
{
    func getNearby(latitude: Double,
                   longitude: Double,
                   radius: Int,
                   placeType: PlaceType?)
        -> Observable<PlaceProtocol>
}

extension PlaceDataProtocol
{
    func getNearby(latitude: Double,
                   longitude: Double,
                   radius: Int = Constants.LocationOptions.Radius,
                   placeType: PlaceType? = nil)
        -> Observable<PlaceProtocol>
    {
        return getNearby(latitude: latitude, longitude: longitude, radius: radius, placeType: placeType)
    }
}
