//
//  RepositoryViewModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
import UIKit
import Network

protocol DataDelegate: AnyObject {
    func dataReadyRepository ()
    func dataReadyUser ()
    func showError (msg: String)
}
class RepositoryViewModel {
    private var service: NetworkManager
    var repositories = [RepositoryModel]()
    weak var delegate: DataDelegate?
    
    init(service: NetworkManager) {
        self.service = service
    }
    
    func getRepositories() -> [RepositoryModel] {
        return repositories
    }
    
}

extension RepositoryViewModel {
    private func requestRepositories(username: String, completion: @escaping (Result<[RepositoryResponseModel]>) -> Void) {
        NetworkManager().request(endpoint: .repos, username: username , completion: completion)
    }
    
    func fetchRepository(username: String) {
        repositories.removeAll()

        requestRepositories(username: username) { [self] result in
            switch result {
            case .success(let datas):
                for data in datas {
                    let emptyLanguage = data.language ?? ""
                    repositories.append(RepositoryModel(repositoryName: data.repositoryName, language: emptyLanguage))
                }
                delegate?.dataReadyRepository()
            case .error(let erro):
                delegate?.showError(msg: "User not found")
                print(erro.localizedDescription)
            }
        }
    }
    
    private func checkInternetConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            if path.status != .satisfied {
                self.delegate?.showError(msg: "No connection")
            }
        }
        
        monitor.start(queue: queue)
    }

}
