import UIKit

class Coordinator {
    weak var appDelegate: AppDelegate?

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    func start() {
        let eventsListViewController = ViewControllerFactory.makeEventsListViewController(coordinator: self)
        let navigationController = UINavigationController(rootViewController: eventsListViewController)
        setupNavigationBarAppearance(navigationController)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        appDelegate?.window = window
        window.makeKeyAndVisible()
    }

    private func setupNavigationBarAppearance(_ navigationController: UINavigationController) {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
    }
}

extension Coordinator: EventsListCoordinator {
    func pushEventDetail(eventViewModel: EventViewModel, navigationController: UINavigationController?) {
        navigationController?.pushViewController(ViewControllerFactory.makeEventDetailViewController(eventViewModel: eventViewModel), animated: true)
    }
}
