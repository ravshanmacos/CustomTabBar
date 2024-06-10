//
//  CustomTabBarController.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 09/06/24.
//

import UIKit

class CustomTabBarController: UITabBarController, TabBarViewDelegate {
    private let tabBarView: TabBarView = {
       let tabBarView = TabBarView()
        return tabBarView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tabBarView.delegate = self
        setupSubviews()
    }
    
    private func setupSubviews() {
        let homeVC = makeViewController(for: .home)
        let orderVC = makeViewController(for: .order)
        let settingsVC = makeViewController(for: .settings)
        let imagesVC = makeViewController(for: .images)
        let deleteVC = makeViewController(for: .delete)
        
        setViewControllers([homeVC, orderVC, settingsVC, imagesVC, deleteVC], animated: true)
        tabBar.addSubviews(tabBarView)
        
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor)
        ])
    }
    
    func makeViewController(for tab: TabProvider.Tab) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = tab.backgroundColor
        return vc
    }
    
    func didSelected(tab: Int) {
        selectedIndex = tab
    }
}
