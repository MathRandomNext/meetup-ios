import Foundation

public protocol PlaceFactoryProtocol
{
    func createPlace(id: String,
                     name: String,
                     address: String?,
                     types: [String]?,
                     rating: Float?,
                     photoUrl: String?)
        -> PlaceProtocol
    
    func createPlaceDetails(id: String,
                            name: String,
                            address: String?,
                            types: [String]?,
                            rating: Float?,
                            photoUrl: String?,
                            websiteUrl: String?,
                            phoneNumber: String?)
        -> PlaceDetailsProtocol
}

extension PlaceFactoryProtocol
{
    public func createPlace(id: String,
                            name: String,
                            address: String? = nil,
                            types: [String]? = nil,
                            rating: Float? = nil,
                            photoUrl: String? = nil)
        -> PlaceProtocol
    {
        return createPlace(id: id,
                           name: name,
                           address: address,
                           types: types,
                           rating: rating,
                           photoUrl: photoUrl)
    }
    
    public func createPlaceDetails(id: String,
                                   name: String,
                                   address: String? = nil,
                                   types: [String]? = nil,
                                   rating: Float? = nil,
                                   photoUrl: String? = nil,
                                   websiteUrl: String? = nil,
                                   phoneNumber: String? = nil)
        -> PlaceDetailsProtocol
    {
        return createPlaceDetails(id: id,
                                  name: name,
                                  address: address,
                                  types: types,
                                  rating: rating,
                                  photoUrl: photoUrl,
                                  websiteUrl: websiteUrl,
                                  phoneNumber: phoneNumber)
    }
}
