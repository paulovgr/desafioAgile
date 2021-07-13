//
//  RepositoryViewModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
import UIKit
protocol RepositoryDelegate: AnyObject {
    func dataReady ()
}
class RepositoryViewModel {
    private var service: NetworkManager
    private var repositories = [RepositoryModel]()
    weak var delegate: RepositoryDelegate?

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
        requestRepositories(username: username) { [self] result in
            switch result {
            case .success(let datas):
                for data in datas {
                    let emptyLanguage = data.language ?? ""
                    repositories.append(RepositoryModel(repositoryName: data.repositoryName, language: emptyLanguage))
                }
                delegate?.dataReady()
                //user = UserModel(avatarUrl: avatarURL, name: name)
            case .error(let erro):
                print(erro)
            }
        }
    }
}
