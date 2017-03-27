import Foundation

public final class API {
    
    private static let googleApiUrl = "https://maps.googleapis.com/maps/api"
    private static let googleApiKey = "AIzaSyCJX1sMGpv4p9Mpww85unBMQHrIr9VM2NM"
    private static let urlNearbyVenues = "\(googleApiUrl)/place/nearbysearch/json"
    
    private static let meetupApiUrl = "https://telerik-meetup.herokuapp.com"
    
    internal static let signInUrl = "\(meetupApiUrl)/auth/login"
    internal static let registerUrl = "\(meetupApiUrl)/auth/register"
    
    public static func nearbySearchUrl(latitude: Double,
                                       longitude: Double,
                                       radius: Int = Constants.LocationOptions.Radius,
                                       placeType: String? = nil)
        -> String
    {
        var url = "\(urlNearbyVenues)?location=\(latitude),\(longitude)&radius=\(radius)&key=\(googleApiKey)"
        if let placeType = placeType
        {
            url.append("&type=\(placeType)")
        }
        return url
    }
}
