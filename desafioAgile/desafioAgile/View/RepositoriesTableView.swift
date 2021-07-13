//
//  RepositoryTableView.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import UIKit
import Kingfisher

class RepositoriesTableView: UIView {
     var repositoryViewModel: RepositoryViewModel?
    private var userViewModel: UserViewModel?
    private let service: NetworkManager
    
    lazy var repositoriesTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorColor = UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        tableView.allowsSelection = false
        tableView.rowHeight = 80
        return tableView
    }()
    
    let profileView: UIView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .green
        return imageView
    }()
    
     init(service: NetworkManager, repositoryViewModel: RepositoryViewModel?,  userViewModel: UserViewModel?) {
        self.service = service
        super.init(frame: .zero)
        self.repositoryViewModel = repositoryViewModel
        self.userViewModel = userViewModel
        print(userViewModel?.getUser())
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = imageView.frame.height/2

    }
    
   
    
}


extension RepositoriesTableView: ViewCode  {
    func setupViewHierarchy() {
        addSubview(repositoriesTableView)
        addSubview(profileView)
        profileView.addSubview(imageView)
        print(profileView.frame.height)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoriesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            repositoriesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            repositoriesTableView.topAnchor.constraint(equalTo: self.profileView.bottomAnchor),
            repositoriesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: self.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.profileView.topAnchor, constant: 100),
           // imageView.leadingAnchor.constraint(equalTo: self.profileView.leadingAnchor,  constant: 100),
          //  imageView.trailingAnchor.constraint(equalTo: self.profileView.trailingAnchor, constant: -100),
            imageView.centerXAnchor.constraint(equalTo: profileView.centerXAnchor),
        //    imageView.bottomAnchor.constraint(equalTo: self.profileView.bottomAnchor, constant: -50),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)

        ])
    }
    
    func setupAditionalConfiguration() {
        print(userViewModel?.getUser().avatarUrl)
        self.imageView.kf.setImage(with: URL(string: userViewModel?.getUser().avatarUrl ??  "https://i1.wp.com/terracoeconomico.com.br/wp-content/uploads/2019/01/default-user-image.png?ssl=1" ))
    }
    
    
}

extension RepositoriesTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let repositoryViewModel = repositoryViewModel?.getRepositories() {
            return repositoryViewModel.count
        } else {
            return 0
        }
    }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RepositoryCell
        cell.setupViews()
        let repository = repositoryViewModel?.getRepositories()[indexPath.row]
        cell.languageName(repository?.language)
        if let name = repository?.repositoryName {
            cell.repositoryName(name)

        }
        return cell
    }

}
