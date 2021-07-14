//
//  RepositoryCell.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import UIKit

class RepositoryCell: UITableViewCell {
     var repositoryName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment  =  .center
        label.textColor =  UIColor(red: 93/255, green: 93/255, blue: 93/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
     var languageName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment  =  .center
        label.textColor =  UIColor(red: 93/255, green: 93/255, blue: 93/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
     
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension RepositoryCell: ViewCode {
    func setupViewHierarchy() {
        addSubview(repositoryName)
        addSubview(languageName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            repositoryName.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
        ])
        
        NSLayoutConstraint.activate([
            languageName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            languageName.topAnchor.constraint(equalTo: self.repositoryName.bottomAnchor, constant: 2),
            
        ])
    }
    
    
}


