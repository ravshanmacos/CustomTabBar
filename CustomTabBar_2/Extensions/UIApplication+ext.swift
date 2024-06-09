//
//  UIApplication+ext.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 08/06/24.
//

import UIKit

extension UIApplication {
    enum SafeArea {
        case top, bottom
    }
    static func getSize(for safeArea: SafeArea) -> CGFloat? {
        guard let window = shared.windows.first else { return nil }
        switch safeArea {
          case .top: return window.safeAreaInsets.top
          case .bottom: return window.safeAreaInsets.bottom
        }
    }
}
