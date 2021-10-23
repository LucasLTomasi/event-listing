enum ViewControllerFactory {
    static func makeEventsListViewController() -> EventsListViewController {
        return EventsListViewController(viewModel: EventsListViewModel())
    }
}
