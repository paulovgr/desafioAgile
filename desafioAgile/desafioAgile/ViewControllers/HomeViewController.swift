//
//  ViewController.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 10/07/21.
//

import UIKit

class HomeViewController: UIViewController {

    private var homeView = HomeView()
    private var service = NetworkManager()
    private var repositoryViewModel: RepositoryViewModel?
    private var userViewModel: UserViewModel?
    private var repositoriesViewController = RepositoriesViewController()

    override func loadView() {
        view = homeView

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeView.getButton().addTarget(self, action: #selector(resultTap), for: .touchUpInside)
       
        userViewModel = UserViewModel(service: service)
        
        repositoryViewModel = RepositoryViewModel(service: service)
        repositoryViewModel?.delegate = self
        self.navigationController?.navigationBar.topItem?.title = "GitHub Viewer"
        
    }
  

    @objc func resultTap() {
        homeView.getButton().setTitle("Carregando", for: .normal)
        homeView.getButton().titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.repositoryViewModel?.fetchRepository(username: homeView.getTextField().text ?? "")
    }
    

}

extension HomeViewController: RepositoryDelegate {
    func dataReady() {
        if let repositoryViewModel = repositoryViewModel {
            repositoriesViewController.repositoryViewModel = repositoryViewModel

        }
        
        self.navigationController?.pushViewController(repositoriesViewController, animated: true)
    }
    
   
    
//    func dataReady() {
//
//
//    }
    
    
}



