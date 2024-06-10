//
//  TabBarItem.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 09/06/24.
//

import UIKit


struct TabBarItem {
    let index: Int
    let title: String
    let image: UIImage?
    let bckColor: UIColor?
    
    static func getMockTabBarItems() -> [TabBarItem] {
        let homeTab = TabProvider.Tab.home
        let orderTab = TabProvider.Tab.order
        let settingsTab = TabProvider.Tab.settings
        let imagesTab = TabProvider.Tab.images
        let deleteTab = TabProvider.Tab.delete
        return [
            .init(index: 0, title: homeTab.rawValue,
                  image: homeTab.image, bckColor: homeTab.backgroundColor),
            .init(index: 1, title: orderTab.rawValue,
                  image: orderTab.image, bckColor: orderTab.backgroundColor),
            .init(index: 2, title: settingsTab.rawValue,
                  image: settingsTab.image, bckColor: settingsTab.backgroundColor),
            .init(index: 3, title: imagesTab.rawValue,
                  image: imagesTab.image, bckColor: imagesTab.backgroundColor),
            .init(index: 4, title: deleteTab.rawValue,
                  image: deleteTab.image, bckColor: deleteTab.backgroundColor),
        ]
    }
}
