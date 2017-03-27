public struct Location: LocationProtocol
{
    public var latitude: Double
    public var longitude: Double
    public var name: String?
    public var locality: String?
    public var thoroughfare: String?
    public var subThoroughfare: String?
    
    init(latitude: Double,
         longitude: Double,
         name: String? = nil,
         locality: String? = nil,
         thoroughfare: String? = nil,
         subThoroughfare: String? = nil)
    {
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.locality = locality
        self.thoroughfare = thoroughfare
        self.subThoroughfare = subThoroughfare
    }
}
