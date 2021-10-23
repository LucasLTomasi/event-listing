import XCTest

class EventListingUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testVariousBehaviors() {
        let app = XCUIApplication()
        app.launch()

        // Static texts
        let eventsListViewTitle = app.staticTexts["Listagem de Eventos"]

        // Idle
        XCTAssert(eventsListViewTitle.exists)

        // Select an event
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        Thread.sleep(forTimeInterval: 1)

        // Go back
        app.navigationBars["Detalhes"].buttons["Voltar"].tap()
        Thread.sleep(forTimeInterval: 1)

        // Select another event
        app.tables.element(boundBy: 0).cells.element(boundBy: 1).tap()
    }
}
