//
//  RepositoryModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
struct RepositoyModel {
    private let repositoryName: String?
    private let language: String?

    internal init(repositoryName: String?, language: String?) {
        self.repositoryName = repositoryName
        self.language = language
    }
}
