import Foundation

public class PlaceFactory: PlaceFactoryProtocol
{
    public func createPlace(id: String,
                            name: String,
                            address: String? = nil,
                            types: [String]? = nil,
                            rating: Float? = nil,
                            photoUrl: String? = nil)
        -> PlaceProtocol
    {
        return Place(id: id, name: name,
                     address: address,
                     types: types,
                     rating: rating,
                     photoUrl: photoUrl)
    }
    
    public func createPlaceDetails() -> PlaceDetailsProtocol
    {
        return PlaceDetails()
    }
}
