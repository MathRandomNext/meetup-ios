import Foundation

public protocol LocationServiceProtocol
{
    var delegate: LocationServiceDelegate? { get set }
}

public protocol LocationServiceDelegate
{
    func locationService (_ service: LocationServiceProtocol, didUpdateLocation location: LocationProtocol)
    
    func locationService (_ service: LocationServiceProtocol, didFailWithError error: Error)
}
