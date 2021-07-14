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
        tableView.separatorColor = UIColor(red: 148/255, green: 148/255, blue: 148/255, alpha: 1)
        tableView.allowsSelection = false
        tableView.dataSource = self
        
        tableView.rowHeight = 80
        return tableView
    }()
    
    let background: UIView = {
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
    
    var username: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    init(service: NetworkManager, repositoryViewModel: RepositoryViewModel?,  userViewModel: UserViewModel?) {
        self.service = service
        self.repositoryViewModel = repositoryViewModel
        self.userViewModel = userViewModel
        super.init(frame: .zero)
        self.setupViews()
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
        addSubview(background)
        background.addSubview(imageView)
        background.addSubview(username)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoriesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            repositoriesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            repositoriesTableView.topAnchor.constraint(equalTo: self.background.bottomAnchor),
            repositoriesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.background.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
        NSLayoutConstraint.activate([
            username.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 10),
            username.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor),
            username.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor)
        ])
    }
    
    func setupAditionalConfiguration() {
        self.imageView.kf.setImage(with: URL(string: userViewModel?.getUser().avatarUrl ??  "https://i1.wp.com/terracoeconomico.com.br/wp-content/uploads/2019/01/default-user-image.png?ssl=1" ))
        self.username.text = userViewModel?.getUser().name ?? ""
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
        cell.languageName.text = repository?.language
        cell.repositoryName.text = repository?.repositoryName

        return cell
    }
    
}
