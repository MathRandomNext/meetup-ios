public protocol LocationProtocol
{
    var latitude: Double { get set }
    var longitude: Double { get set }
    var name: String? { get set }
    var locality: String? { get set }
    var thoroughfare: String? { get set }
    var subThoroughfare: String? { get set }
}
