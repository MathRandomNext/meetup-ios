import Foundation
import Alamofire
import RxSwift

public class Requester: RequesterProcol
{
    private let responseFactory: ResponseFactoryProtocol
    
    init(responseFactory: ResponseFactoryProtocol)
    {
        self.responseFactory = responseFactory
    }
    
    public func get(_ url: String) -> Observable<ResponseProtocol>
    {
        return Observable.create
        { observer in
            Alamofire.request(url)
                .validate()
                .responseJSON { response in
                    let secondaryResponse = response.response
                    
                    var responseResult = self.responseFactory.createResponse()
                    responseResult.statusCode = secondaryResponse?.statusCode
                    responseResult.headers = secondaryResponse?.allHeaderFields as? [String: Any]
                    
                    switch response.result
                    {
                    case .success(let value):
                        responseResult.body = value as? [String: Any]
                        observer.onNext(responseResult)
                    case .failure(let error):
                        observer.onError(error)
                    }
                    
                    observer.onCompleted()
            }
            
            return Disposables.create()
        }
    }
}
