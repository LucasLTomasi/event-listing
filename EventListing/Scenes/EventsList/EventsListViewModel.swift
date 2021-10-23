import RxSwift

protocol EventsListViewModelProtocol {
    var events: PublishSubject<[Event]> { get }

    func getEvents()
}

class EventsListViewModel: EventsListViewModelProtocol {
    private let apiClient: APIClientProtocol
    var events: PublishSubject<[Event]> = PublishSubject()
    private let disposeBag = DisposeBag()

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func getEvents() {
        apiClient
            .request()
            .subscribe(onNext: { response in
                self.events.onNext(response)
            }, onError: { error in
                print(error)
                self.events.onError(error)
            })
            .disposed(by: disposeBag)
    }
}
