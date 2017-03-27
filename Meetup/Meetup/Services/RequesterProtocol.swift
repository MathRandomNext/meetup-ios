import Foundation
import RxSwift

public protocol RequesterProcol
{
    func get(_ url: String) -> Observable<ResponseProtocol>
}
