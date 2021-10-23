enum ViewControllerFactory {
    static func makeEventsListViewController(coordinator: EventsListCoordinator) -> EventsListViewController {
        let viewModel = EventsListViewModel()
        let viewController = EventsListViewController(viewModel: viewModel, coordinator: coordinator)
        return viewController
    }

    static func makeEventDetailViewController(eventViewModel: EventViewModel) -> EventDetailViewController {
        EventDetailViewController(viewModel: eventViewModel)
    }
}
