import Foundation
import CoreLocation

public class LocationService: NSObject, LocationServiceProtocol, CLLocationManagerDelegate
{
    public var delegate: LocationServiceDelegate?
    
    private let locationManager: CLLocationManager =
    {
            let _locationManager = CLLocationManager()
            _locationManager.distanceFilter = CLLocationDistance(Constants.LocationOptions.Radius)
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest
            return _locationManager
    }()
    
    private var locationFactory: LocationFactoryProtocol!
    
    init(locationFactory: LocationFactoryProtocol)
    {
        super.init()
        self.locationFactory = locationFactory
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    convenience override init()
    {
        self.init(locationFactory: LocationFactory())
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if let delegate = self.delegate {
            getCurrentLocation(locationCoordinate: locations[0].coordinate)
            { location in
                delegate.locationService(self, didUpdateLocation: location)
            }
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        delegate?.locationService(self, didFailWithError: error)
    }
    
    private func getCurrentLocation(locationCoordinate: CLLocationCoordinate2D,
                                    callback: @escaping (_: LocationProtocol) -> ())
    {
        let latitude = locationCoordinate.latitude
        let longitude = locationCoordinate.longitude
        
        var currentLocation = locationFactory.createLocation(latitude: latitude, longitude: longitude)
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoCoder.reverseGeocodeLocation(location)
        { (placemarks, error) in
            let placeArray = placemarks as [CLPlacemark]!
            
            var placeMark: CLPlacemark!
            placeMark = placeArray?[0]
            
            currentLocation.name = placeMark?.name
            currentLocation.locality = placeMark?.locality
            currentLocation.thoroughfare = placeMark?.thoroughfare
            currentLocation.subThoroughfare = placeMark?.subThoroughfare
            
            callback(currentLocation)
        }
    }
}
