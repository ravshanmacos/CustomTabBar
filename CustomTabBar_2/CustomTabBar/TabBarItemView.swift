//
//  TabBarItemView.swift
//  CustomTabBar_2
//
//  Created by Ravshan Winter on 09/06/24.
//

import UIKit

class TabBarItemView: UIView {
    //MARK: Properties
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageWrapper: UIView = {
       let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var contentView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.layer.cornerRadius = 25
        return stack
    }()
    
    var isActive: Bool = false {
        didSet {
            contentView.backgroundColor = isActive ? .green.withAlphaComponent(0.5) : .clear
            UIView.animate(withDuration: 0.2) {[weak self] in
                guard let self else { return }
                titleLabel.text = isActive ? tabBarItem.title : ""
                imageView.tintColor = isActive ? .black : .systemBlue
                layoutIfNeeded()
            }
        }
    }
    
    
    private let tabBarItem: TabBarItem
    let index: Int
    var isSelected: (TabBarItemView) -> Void
    
    //MARK: Methods
    
    init(tabBarItem: TabBarItem, isSelected: @escaping (TabBarItemView) -> Void) {
        self.tabBarItem = tabBarItem
        self.index = tabBarItem.index
        self.isSelected = isSelected
        super.init(frame: .zero)
        setupSubviews()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        addSubviews(contentView)
        contentView.addArrangedSubviews(imageWrapper, titleLabel)
        imageWrapper.addSubviews(imageView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            //imageWrapper.widthAnchor.constraint(equalToConstant: 50),
            
            imageView.centerYAnchor.constraint(equalTo: imageWrapper.centerYAnchor),
            //imageView.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageWrapper.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: imageWrapper.trailingAnchor, constant: -5),
            
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureSubviews() {
        imageView.image = tabBarItem.image
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onTap() {
        isSelected(self)
    }
}

