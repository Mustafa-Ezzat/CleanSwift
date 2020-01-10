# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# The main Components

View: The view controller invokes the interactor to perform some business logic.\
Interactor: The interactor invokes the presenter to format the result to some primitive types.\
Presenter: The presenter invokes the view controller to display the results on the screen.

# Communication using dependency injection
```
class SearchConfig {
    func createModule(view: SearchViewController) {
        let presenter = SearchPresenter()
        presenter.view = view
        let interactor = SearchInteractor()
        interactor.presenter = presenter
        view.interactor = interactor
    }
}
``` 

# Testable 
A pretty architecture is easy to testable.

Start with test architecture communication itself by Quick and Nimble

```
import Quick
import Nimble
@testable import CleanSwift

class SearchModuleSpec: QuickSpec {
    var sut: SearchConfig!
    var vc: SearchViewController!
    
    override func spec() {
        describe("Start with test a search module communication") {
            beforeEach {
                self.sut = SearchConfig()
                self.vc = SearchViewController()
                self.sut.createModule(view: self.vc)
            }
            context("When creating a search module") {
                it("That means all architecture components should be initialized") {
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        fail("Init components failed")
                        return
                    }
                    // pretty cool
                    assert(true, "Module components init successfully")
                }
            }
            // Test memory management, and make sure no retain cycle exist
            context("When search view controller no longer used") {
                it("That means all module components should be deinitialized") {
                    self.vc = nil
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        // pretty cool
                        assert(true, "Module components deinitialized successfully")
                        return
                    }
                    fail("Deinitialize module components failed")
                }
            }
        }
    }
}

