import Foundation

public struct LocationFactory: LocationFactoryProtocol
{
    public func createLocation(latitude: Double,
                               longitude: Double,
                               name: String? = nil,
                               locality: String? = nil,
                               thoroughfare: String? = nil,
                               subThoroughfare: String? = nil)
        -> LocationProtocol
    {
        return Location(latitude: latitude,
                        longitude: longitude,
                        name: name,
                        locality: locality,
                        thoroughfare: thoroughfare,
                        subThoroughfare: subThoroughfare)
    }
}
