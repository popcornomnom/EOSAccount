
import UIKit

protocol AccountRouterDelegate {
    <#func goToSomewhere() { }#>
}

class AccountRouter: AccountRouterDelegate {
    weak var viewController: MyViewController!
    
        init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    <#func goToSomewhere() { }#>
}
