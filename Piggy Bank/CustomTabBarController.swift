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
        //firstViewController.title = "My Movie List"
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
        
        //tabBar.isTranslucent = false
        tabBar.tintColor = .white
        tabBar.barTintColor = .white
        tabBar.backgroundColor = UIColor(red: 26/255, green: 21/255, blue: 57/255, alpha: 1.0)
    }

}
