# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# Testable 
A pretty architecture is easy to be testable.

Test init

```
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
```

Test deinit

```
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

