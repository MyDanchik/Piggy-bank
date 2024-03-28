import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let firstViewController = UINavigationController(rootViewController: DiscountView())
        firstViewController.tabBarItem.title = nil
        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        firstViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.discount)
        
        let secondViewController = UINavigationController(rootViewController: BanksView())
        secondViewController.tabBarItem.title = nil
        secondViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        secondViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.banks)
        
        let thirdViewController = UINavigationController(rootViewController: ExchangeView())
        thirdViewController.tabBarItem.title = nil
        thirdViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        thirdViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.exchange)
        
        let fourthViewController = UINavigationController(rootViewController: ConverterView())
        fourthViewController.tabBarItem.title = nil
        fourthViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        fourthViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.converter)
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
        
        tabBar.tintColor = UIColor(resource: .Colors.tintSelectColorTapBar)
        tabBar.unselectedItemTintColor = UIColor(resource: .Colors.tintColorTapBar)
        tabBar.backgroundColor = UIColor(resource: .Colors.backgroundTapBar)
    }
    
}

