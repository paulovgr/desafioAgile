//
//  RepositoryTableView.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import UIKit

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
    
     init(service: NetworkManager, repositoryViewModel: RepositoryViewModel?,  userViewModel: UserViewModel?) {
        self.service = service
        super.init(frame: .zero)
        self.repositoryViewModel = repositoryViewModel
        self.userViewModel = userViewModel
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}


extension RepositoriesTableView: ViewCode  {
    func setupViewHierarchy() {
        addSubview(repositoriesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoriesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            repositoriesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            repositoriesTableView.topAnchor.constraint(equalTo: self.topAnchor),
            repositoriesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
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
