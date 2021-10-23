import RxSwift

protocol EventsListViewModelProtocol {
    var events: PublishSubject<[Event]> { get }
    var isNetworkConnectionAvailable: PublishSubject<Bool> { get }

    func getEvents()
}

class EventsListViewModel: EventsListViewModelProtocol {
    private let apiClient: APIClientProtocol
    private let disposeBag = DisposeBag()
    var events: PublishSubject<[Event]> = PublishSubject()
    var isNetworkConnectionAvailable: PublishSubject<Bool> = PublishSubject()

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
        observeNetworkConnectionAvailability()
            .subscribe(onNext: { isAvailable in
                self.isNetworkConnectionAvailable.onNext(isAvailable)
            })
            .disposed(by: disposeBag)
    }

    func getEvents() {
        apiClient
            .request()
            .subscribe(onNext: { response in
                self.events.onNext(response)
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }

    private func observeNetworkConnectionAvailability() -> Observable<Bool> {
        return Observable.create { observer -> Disposable in
            NetworkConnectionManager.shared.observe { availability in
                observer.onNext(availability == .available)
            }
            return Disposables.create()
        }
    }
}
