import UIKit
import RxSwift

class HomeViewController: UIViewController, LocationServiceDelegate
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var signOutButton: UIBarButtonItem!
    
    internal var locationService: LocationServiceProtocol!
    internal var userData: UserDataProtocol!
    
    private let disposeBag = DisposeBag()
    private var currentLocation: LocationProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.locationService.delegate = self
        self.setRightBarButtonItem()
    }
    
    @IBAction func onNavigationMenuItemClick(_ sender: UIButton)
    {
        let nearbyPlacesVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: Constants.ViewControllerIdentifiers.NearbyViewController)
            as! NearbyViewController
        
        nearbyPlacesVC.placeType = PlaceType(rawValue: sender.tag)
        nearbyPlacesVC.currentLocation = self.currentLocation
        
        self.navigationController?.show(nearbyPlacesVC, sender: self)
    }
    
    func onSignOutButtonClick()
    {
        self.startLoading()
        self.userData.signOut()
        self.changeInitialViewController(identifier: "homeVC")
        self.showSuccess(withStatus: "You have signed out successfully")
    }
    
    func locationService(_ service: LocationServiceProtocol, didUpdateLocation location: LocationProtocol)
    {
        self.currentLocation = location
        self.setTitle(location: location)
    }
    
    func locationService(_ service: LocationServiceProtocol, didFailWithError error: Error)
    {
        self.clearTitle()
    }
    
    private func setTitle(location: LocationProtocol)
    {
        var title: String?
        var subtitle: String?
        
        func createSecondaryTitle(_ location: LocationProtocol) -> String?
        {
            var subtitle: String?
            
            let locationLocality = location.locality ?? ""
            let locationThoroughfare = location.thoroughfare ?? ""
            let locationSubThoroughfare = location.subThoroughfare ?? ""
            
            if !locationLocality.isEmpty
            {
                subtitle = locationLocality
            }
            
            if !locationThoroughfare.isEmpty && (subtitle ?? "").isEmpty
            {
                subtitle = "\(locationThoroughfare) \(locationSubThoroughfare)"
            }
            else if !locationThoroughfare.isEmpty && (subtitle ?? "").isEmpty
            {
                subtitle! += ", \(locationThoroughfare) \(locationSubThoroughfare)"
            }
            
            return subtitle
        }
        
        let locationName = location.name ?? ""
        
        if locationName.isEmpty
        {
            title = createSecondaryTitle(location)
        }
        else
        {
            title = locationName
            subtitle = createSecondaryTitle(location)
        }
        
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
    
    private func clearTitle()
    {
        self.titleLabel.text = "Unknown location"
        self.subtitleLabel.text = nil
    }
    
    private func setRightBarButtonItem()
    {
        if self.userData.isLoggedIn()
        {
            let signOutButton = UIBarButtonItem(title: "Sign Out",
                                                style: .plain,
                                                target: self,
                                                action: #selector(HomeViewController.onSignOutButtonClick))
            self.navigationItem.rightBarButtonItem = signOutButton
        }
        else
        {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    private func changeInitialViewController(identifier: String)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialViewController = storyboard
            .instantiateViewController(withIdentifier: identifier)
        UIApplication.shared.keyWindow?.rootViewController = initialViewController
    }
}
