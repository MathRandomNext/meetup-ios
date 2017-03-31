import Foundation

public protocol PlaceDetailsProtocol: PlaceProtocol
{
    var websiteUrl: String? { get set }
    var phoneNumber: String? { get set }
}
