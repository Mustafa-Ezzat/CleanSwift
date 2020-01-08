# Clean Swift

Clean swift is an architecture that follows Uncle Bob’s Clean Architecture and SOLID Principles and applies them to iOS development using Swift.

# The main Components

View: The view controller invokes the interactor to perform some business logic.\
Interactor: The interactor invokes the presenter to format the result to some primitive types.\
Presenter: The presenter invokes the view controller to display the results on the screen.\

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

