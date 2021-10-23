import RxSwift

protocol APIClientProtocol {
    func request() -> Observable<[Event]>
}
