//
//  TabProvider.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 10/06/24.
//

import UIKit

struct TabProvider {
    enum Tab: String {
        case home = "Home"
        case order = "Order"
        case settings = "Settings"
        case images = "Images"
        case delete = "Delete"
        
        var image: UIImage? {
            switch self {
            case .home: return UIImage(systemName: "house.circle.fill")
            case .order: return UIImage(systemName: "basket.fill")
            case .settings: return UIImage(systemName: "gear.circle.fill")
            case .images: return UIImage(systemName: "photo.circle")
            case .delete: return UIImage(systemName: "trash.circle.fill")
            }
        }
        
        var backgroundColor: UIColor? {
            switch self {
            case .home: return .blue
            case .order: return .green
            case .settings: return .orange
            case .images: return .yellow
            case .delete: return .red
            }
        }
    }
}
