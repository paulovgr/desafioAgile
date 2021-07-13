//
//  ProfileView.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 13/07/21.
//

import UIKit

class ProfileView: UIView {
    let backgraundView: UIView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProfileView: ViewCode {
    func setupViewHierarchy() {
        addSubview(backgraundView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgraundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgraundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgraundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgraundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    
}
