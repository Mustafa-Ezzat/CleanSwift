# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# Testable 
A pretty architecture is easy to be testable.

`
    func testSearchModule_Init() {
        guard let interactor = vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
            XCTFail()
            return
        }
        // That mean all architecture components initialized
        XCTAssert(true)
    }
`

Test deinit

`
   func testSearchModule_Deinit() {
        // Test Memory Management
        // check deinit
        vc = nil
        guard let interactor = vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
            // That mean all architecture components deinitialized
            XCTAssert(true)
            return
        }
        XCTFail()
    }




