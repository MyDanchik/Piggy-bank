import UIKit

final class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        view.backgroundColor = UIColor(red: 26/255, green: 21/255, blue: 57/255, alpha: 1.0)
        
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = .white
        
        let firstViewController = DefaultCardsView()
        firstViewController.tabBarItem.title = nil
        firstViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        firstViewController.tabBarItem.image = UIImage(named: "Vector")

        let secondViewController = DefaultCardsView()
        secondViewController.tabBarItem.title = nil
        secondViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        secondViewController.tabBarItem.image = UIImage(named: "Vector2")
        
        let thirdViewController = DefaultCardsView()
        thirdViewController.tabBarItem.title = nil
        thirdViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        thirdViewController.tabBarItem.image = UIImage(named: "Vector3")
        
        let fourthViewController = DefaultCardsView()
        fourthViewController.tabBarItem.title = nil
        fourthViewController.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        fourthViewController.tabBarItem.image = UIImage(named: "Vector4")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
    }
}



/*
// Задаем свой размер изображения
let originalImage = UIImage(named: "Vector")
let imageSize = CGSize(width: 27, height: 27) // Размер вашего изображения
let scaledImage = originalImage?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)

// Масштабируем изображение до нужного размера
let renderer = UIGraphicsImageRenderer(size: imageSize)
let scaledToSizeImage = renderer.image { (context) in
    scaledImage?.draw(in: CGRect(origin: .zero, size: imageSize))
}

firstViewController.tabBarItem.image = scaledToSizeImage
*/
