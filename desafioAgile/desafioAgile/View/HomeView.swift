//
//  HomeView.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import UIKit

class HomeView: UIView {
     let searchButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.borderColor =  CGColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius =  10
        textField.placeholder = "Username"
        textField.font = UIFont.systemFont(ofSize: 25)
        textField.textColor = UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        textField.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        return textField
    }()

    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getButton (fontSize: Int, titleLabel: String)  {
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        searchButton.setTitle(titleLabel, for: .normal)
    }
    
    func getTextField () -> UITextField {
        return self.textField
    }
}

extension HomeView: ViewCode {
    func setupViewHierarchy() {
        addSubview(textField)
        addSubview(searchButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            searchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            searchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = .white
    }
}


