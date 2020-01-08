# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# Testable 
A pretty architecture is easy to be testable.

Test module init
```

    func testSearchModule_Init() {
        guard let interactor = vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
            XCTFail()
            return
        }
        // That mean all architecture components init, pretty cool
        XCTAssert(true)
    }
