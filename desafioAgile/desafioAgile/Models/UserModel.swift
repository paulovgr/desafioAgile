//
//  UserModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation

struct UserModel {
     var avatarUrl: String?
     var name: String?
    
    internal init(avatarUrl: String? = nil, name: String? = nil) {
        self.avatarUrl = avatarUrl
        self.name = name
    }
}
