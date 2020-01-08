# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# The main Components

View: User interface
Interactor: Business logic
Presenter: UI logic

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
A pretty architecture is easy to be testable.

