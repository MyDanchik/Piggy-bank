import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        // Создание экземпляров контроллеров, которые будут вкладками в таб-баре
        let firstViewController = UINavigationController(rootViewController: DefaultCardsView())
        firstViewController.tabBarItem.title = nil
        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        firstViewController.tabBarItem.image = UIImage(named: "Vector")
        
        let secondViewController = UINavigationController(rootViewController: DefaultDiscountView())
        secondViewController.tabBarItem.title = nil
        secondViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        secondViewController.tabBarItem.image = UIImage(named: "Vector2")
        
        let thirdViewController = UINavigationController(rootViewController: DefaultBanksView())
        thirdViewController.tabBarItem.title = nil
        thirdViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        thirdViewController.tabBarItem.image = UIImage(named: "Vector3")
        
        let fourthViewController = UINavigationController(rootViewController: DefaultExchangeView())
        fourthViewController.tabBarItem.title = nil
        fourthViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        fourthViewController.tabBarItem.image = UIImage(named: "Vector4")
        
        // Установка контроллеров в таб-бар контроллер
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        
        tabBar.tintColor = UIColor(red: 197/255, green: 119/255, blue: 209/255, alpha: 1.0)
        tabBar.unselectedItemTintColor = .backgroundColorMain
        tabBar.backgroundColor = UIColor(red: 26/255, green: 21/255, blue: 57/255, alpha: 1.0)
    }
    
}
