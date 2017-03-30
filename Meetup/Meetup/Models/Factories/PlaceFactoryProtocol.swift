import Foundation

public protocol PlaceFactoryProtocol
{
    func createPlace(id: String,
                     name: String,
                     address: String?,
                     types: [String]?,
                     rating: Float?,
                     photoUrl: String?) -> PlaceProtocol
    
    func createPlaceDetails() -> PlaceDetailsProtocol
    
}

extension PlaceFactoryProtocol
{
    func createPlace(id: String,
                     name: String,
                     address: String? = nil,
                     types: [String]? = nil,
                     rating: Float? = nil,
                     photoUrl: String? = nil)
        -> PlaceProtocol
    {
        return createPlace(id: id, name: name, address: address, types: types, rating: rating, photoUrl: photoUrl)
    }
}
