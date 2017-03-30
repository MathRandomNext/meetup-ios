import Foundation

public final class API
{    
    private static let googleApiUrl = "https://maps.googleapis.com/maps/api"
    private static let googleApiKey = "AIzaSyCJX1sMGpv4p9Mpww85unBMQHrIr9VM2NM"
    private static let urlNearbyPlaces = "\(googleApiUrl)/place/nearbysearch/json"
    private static let urlPlaceDetails = "\(googleApiUrl)/place/details/json"
    private static let urlPlacePhoto = "\(googleApiUrl)/place/photo"
    
    private static let meetupApiUrl = "https://telerik-meetup.herokuapp.com"
    
    internal static let signInUrl = "\(meetupApiUrl)/auth/login"
    internal static let registerUrl = "\(meetupApiUrl)/auth/register"
    
    public static func nearbySearchUrl(latitude: Double,
                                       longitude: Double,
                                       radius: Int = Constants.LocationOptions.Radius,
                                       placeType: String? = nil)
        -> String
    {
        var url = "\(urlNearbyPlaces)?location=\(latitude),\(longitude)&radius=\(radius)&key=\(googleApiKey)"
        if let placeType = placeType
        {
            url.append("&type=\(placeType)")
        }
        return url
    }
    
    public static func placeDetailsUrl(placeId: String) -> String
    {
        let url = "\(urlPlaceDetails)?placeid=\(placeId)&key=\(googleApiKey)"
        return url
    }
    
    public static func placePhotoUrl(photoReference: String, maxWidth: Int) -> String
    {
        let url = "\(urlPlacePhoto)?maxwidth=\(maxWidth)&photoreference=\(photoReference)&key=\(googleApiKey)"
        return url
    }
}
