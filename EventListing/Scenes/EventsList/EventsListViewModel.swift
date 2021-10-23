import RxSwift

class EventsListViewModel {
    private let apiClient: APIClientProtocol
    let events: PublishSubject<[Event]> = PublishSubject()
    private let disposeBag = DisposeBag()

    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func getEvents(tableView: UITableView) {
        apiClient
            .request()
            .subscribe(onNext: { response in
                self.events.onNext(response)
            }, onError: { response in
                print(response)
            })
            .disposed(by: disposeBag)
    }
}
