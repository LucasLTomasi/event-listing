import RxSwift

class EventsListViewModel {
    private let apiClient: APIClientProtocol
    private let events: PublishSubject<[Event]> = PublishSubject()
    private let disposeBag = DisposeBag()

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func getEvents() {
        apiClient
            .request()
            .subscribe(onNext: { response in
                print(response)
            }, onError: { response in
                print(response)
            })
            .disposed(by: disposeBag)
    }
}
