import UIKit
import RxSwift

class AccountViewController: UIViewController
{
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    internal var userData: UserDataProtocol!
    
    private var isSignInSegmentValue = true
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onSubmitButtonClick(_ sender: Any)
    {
        self.startLoading()
        
        let username = self.usernameTextField.text
        let password = self.passwordTextField.text
        
        guard username != nil, password != nil else
        {
            return
        }
        
        guard username!.count() >= 4 && username!.count() <= 10 else
        {
            self.showError(withStatus: "Username must be between 4 and 10 symbols long")
            return
        }
        
        guard password!.count() >= 4 && password!.count() <= 20 else
        {
            self.showError(withStatus: "Password must be between 4 and 20 symbols long")
            return
        }
        
        if self.isSignInSegmentValue
        {
            userData
                .signIn(username: username!, password: password!)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { res in
                    self.showSuccess(withStatus: "You have signed in successfully")
                }, onError: { error in
                    self.showError(withStatus: "Invalid username or password")
                })
                .disposed(by: disposeBag)
        }
        else
        {
            userData
                .register(username: username!, password: password!)
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { res in
                    self.showSuccess(withStatus: "You have registered successfully")
                }, onError: { error in
                    self.showError(withStatus: "Username already exists")
                })
                .disposed(by: disposeBag)
        }
    }
    
    @IBAction func onSegmentValueChanged(_ sender: Any)
    {
        self.isSignInSegmentValue = !self.isSignInSegmentValue
        
        if self.isSignInSegmentValue
        {
            submitButton.setTitle("Sign In", for: .normal)
        }
        else
        {
            submitButton.setTitle("Register", for: .normal)
        }
    }
}
