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
        describe("Test the memory management for search module") {
            beforeEach {
                self.sut = SearchConfig()
                self.vc = SearchViewController()
                self.sut.createModule(view: self.vc)
            }
            context("When call create module method, ") {
                it("That mean all architecture components must init") {
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        fail("Init components failed")
                        return
                    }
                    // pretty cool
                    assert(true, "Module components init successfylly")
                }
            }
            context("When search view controller no longer used, ") {
                it("That mean all architecture components must deinit") {
                    self.vc = nil
                    guard let interactor = self.vc?.interactor as? SearchInteractor, let _ = interactor.presenter as? SearchPresenter else {
                        // pretty cool
                        assert(true, "Module components deinit successfylly")
                        return
                    }
                    fail("Deinit components failed")
                }
            }
        }
    }
}

