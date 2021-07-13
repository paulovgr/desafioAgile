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
    private var repositories = [RepositoyModel]()
    weak var delegate: RepositoryDelegate?

     init(service: NetworkManager) {
        self.service = service
        
        
    }
    
    func getRepositories() -> [RepositoyModel] {
        return repositories
    }

}

extension RepositoryViewModel {
    private func requestRepositories(completion: @escaping (Result<[RepositoryResponseModel]>) -> Void) {
        NetworkManager().request(endpoint: .repos , completion: completion)
    }
    
     func fetchRepository() {
        requestRepositories { [self] result in
            switch result {
            case .success(let datas):
                for data in datas {
                    let emptyLanguage = data.language ?? ""
                    repositories.append(RepositoyModel(repositoryName: data.repositoryName, language: emptyLanguage))
                }
                delegate?.dataReady()
                //user = UserModel(avatarUrl: avatarURL, name: name)
            case .error(let erro):
                print(erro)
            }
        }
    }
}
