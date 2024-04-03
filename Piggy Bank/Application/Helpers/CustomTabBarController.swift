import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let discounViewController = UINavigationController(rootViewController: DiscountView())
        discounViewController.tabBarItem.title = nil
        discounViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        discounViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.discount)
        
        let banksViewController = UINavigationController(rootViewController: BanksView())
        banksViewController.tabBarItem.title = nil
        banksViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        banksViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.banks)
        
        let exchangeViewController = UINavigationController(rootViewController: ExchangeView())
        exchangeViewController.tabBarItem.title = nil
        exchangeViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        exchangeViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.exchange)
        
        let converterViewController = UINavigationController(rootViewController: ConverterView())
        converterViewController.tabBarItem.title = nil
        converterViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        converterViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.converter)
        
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        settingsViewController.tabBarItem.title = nil
        settingsViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        settingsViewController.tabBarItem.image = UIImage(resource: .Images.TapBar.settings)
        
        viewControllers = [discounViewController, banksViewController, exchangeViewController, converterViewController, settingsViewController]
        
        tabBar.tintColor = UIColor(resource: .Colors.tintSelectColorTapBar)
        tabBar.unselectedItemTintColor = UIColor(resource: .Colors.tintColorTapBar)
        tabBar.backgroundColor = UIColor(resource: .Colors.backgroundTapBar)
    }
    
}

