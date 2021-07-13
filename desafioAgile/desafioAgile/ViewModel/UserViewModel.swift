//
//  UserViewModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
import UIKit

class UserViewModel {
    private var service: NetworkManager
    private var user = UserModel()

     init(service: NetworkManager) {
        self.service = service
    }
    
    func getUser() -> UserModel {
        return user
    }

}

extension UserViewModel {
    private func requestUser(username: String, completion: @escaping (Result<UserResponseModel>) -> Void) {
        NetworkManager().request(endpoint: .user, username: username , completion: completion)
    }
    
     func fetchUser(username: String) {
        requestUser(username: username) { [self] result in
            switch result {
            case .success(let data):
                guard let avatarURL = data.avatarUrl,let name = data.name else {
                    return
                }
                user = UserModel(avatarUrl: avatarURL, name: name)
            case .error(let erro):
                print(erro)
            }
        }
    }
}
