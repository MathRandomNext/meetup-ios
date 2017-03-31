import Foundation

public struct PlaceDetails: PlaceDetailsProtocol
{
    public var id: String
    public var name: String
    public var address: String?
    public var types: [String]?
    public var rating: Float?
    public var photoUrl: String?
    public var websiteUrl: String?
    public var phoneNumber: String?
}
