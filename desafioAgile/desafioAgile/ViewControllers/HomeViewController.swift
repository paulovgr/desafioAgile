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

    override func loadView() {
        view = homeView

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userViewModel = UserViewModel(service: service)
        homeView.searchButton.addTarget(self, action: #selector(resultTap), for: .touchUpInside)
    

        
        
        repositoryViewModel = RepositoryViewModel(service: service)
        repositoryViewModel?.delegate = self
        self.navigationController?.navigationBar.topItem?.title = "GitHub Viewer"
        
    }
    
    
    

}

extension HomeViewController {
    @objc func resultTap() {
        homeView.getButton(fontSize: 30, titleLabel: "Loading")
        if let username = homeView.getTextField().text  {
            if username != "" {
                DispatchQueue.main.async { [self] in
                    self.repositoryViewModel?.fetchRepository(username: username)
                    self.userViewModel?.fetchUser(username: username)
                }
            } else {
                showError(msg: "Username empty")

                
                
            }

        } else {
            showError(msg: "Username empty")
        }
        homeView.getButton(fontSize: 25, titleLabel: "Search")

    }
}

extension HomeViewController: RepositoryDelegate {
    func showError(msg: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Erro", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        homeView.getButton(fontSize: 25, titleLabel: "Search")
    }
    
    func dataReady() {
        let repositoriesViewController = RepositoriesViewController()

        if let repositoryViewModel = repositoryViewModel {
            repositoriesViewController.repositoryViewModel = repositoryViewModel
        }
        repositoriesViewController.userViewModel = userViewModel

        self.navigationController?.pushViewController(repositoriesViewController, animated: true)
    }
    
   
    
//    func dataReady() {
//
//
//    }
    
    
}



