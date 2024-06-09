//
//  TabBarView.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 09/06/24.
//
import UIKit

protocol TabBarViewDelegate {
    func didSelected(tab: Int)
}

class TabBarView: UIView {
    //MARK: Properties
    
    private let contentView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 25
        stack.backgroundColor = .white
        return stack
    }()
    
    private var tabBarItems: [TabBarItem]
    var delegate: TabBarViewDelegate?
    
    //MARK: Methods
    
    init(tabBarItems: [TabBarItem] = TabBarItem.getMockTabBarItems()) {
        self.tabBarItems = tabBarItems
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(contentView)
        tabBarItems.enumerated().forEach { (index, item) in
            let tabBarItemView = TabBarItemView(tabBarItem: item, isSelected: onTap)
            if index == 0 { tabBarItemView.isActive = true  }
            
            contentView.addArrangedSubviews(tabBarItemView)
        }
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 50),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func onTap(tabBarItemView: TabBarItemView) {
        contentView.arrangedSubviews.forEach { arrangedSubview in
            guard let subview = arrangedSubview as? TabBarItemView else { return }
            subview.isActive = false
        }
        tabBarItemView.isActive = true
        delegate?.didSelected(tab: tabBarItemView.index)
    }
}
