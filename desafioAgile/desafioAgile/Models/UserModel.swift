//
//  UserModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation

struct UserModel {
    private var avatarUrl: String?
    private var name: String?
    
    internal init(avatarUrl: String? = nil, name: String? = nil) {
        self.avatarUrl = avatarUrl
        self.name = name
    }
}
