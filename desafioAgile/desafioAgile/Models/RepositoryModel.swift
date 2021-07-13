//
//  RepositoryModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
struct RepositoryModel {
     let repositoryName: String?
     let language: String?

    internal init(repositoryName: String? = nil, language: String? = nil) {
        self.repositoryName = repositoryName
        self.language = language
    }
}
