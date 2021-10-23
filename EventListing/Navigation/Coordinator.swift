import UIKit

class Coordinator {
    weak var appDelegate: AppDelegate?

    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }

    func start() {
        let eventsListViewController = ViewControllerFactory.makeEventsListViewController()
        let navigationController = UINavigationController(rootViewController: eventsListViewController)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        appDelegate?.window = window
        window.makeKeyAndVisible()
    }
}
