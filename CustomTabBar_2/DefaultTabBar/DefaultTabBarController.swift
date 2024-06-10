//
//  DefaultTabBarController.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 08/06/24.
//

import UIKit

class DefaultTabBarController: UITabBarController {
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupAppearance()
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let homeVC = makeViewController(for: .home)
        let orderVC = makeViewController(for: .order)
        let settingsVC = makeViewController(for: .settings)
        setViewControllers([homeVC, orderVC, settingsVC], animated: true)
    }
    
    private func setupAppearance() {
        let positionOnX: CGFloat = 0
        let positionOnY: CGFloat = 0
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + (UIApplication.getSize(for: .bottom) ?? 0.0)
        
        let roundedRect: CGRect = .init(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height)
        let cornerRadius = height/2
        
        let path = UIBezierPath(rect: roundedRect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        tabBar.layer.addSublayer(shapeLayer)
    }
}

//MARK: Configuring

private extension UITabBarController {
    
    func makeViewController(for tab: TabProvider.Tab) -> UIViewController {
        let vc = UIViewController()
        vc.tabBarItem = makeTabbarItem(for: tab)
        vc.view.backgroundColor = tab.backgroundColor
        return vc
    }
    
    func makeTabbarItem(for tab: TabProvider.Tab) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = tab.rawValue
        tabBarItem.image = tab.image
        tabBarItem.badgeValue = "4"
        return tabBarItem
    }
}



