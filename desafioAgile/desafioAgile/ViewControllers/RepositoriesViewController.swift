//
//  RepositoriesViewController.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
import UIKit

class RepositoriesViewController: UIViewController {
    private let service = NetworkManager()
    var repositoryViewModel: RepositoryViewModel?
    var userViewModel: UserViewModel?
    var viewTable: RepositoriesTableView?
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewTable
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewTable = RepositoriesTableView(service: service, repositoryViewModel: repositoryViewModel, userViewModel: userViewModel)
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "Back"
    }
  
}
