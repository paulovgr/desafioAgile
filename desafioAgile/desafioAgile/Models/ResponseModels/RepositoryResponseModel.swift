//
//  RepositoryResponseModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation

struct RepositoryResponseModel: Decodable {
     let repositoryName: String?
     let language: String?
    
    enum CodingKeys: String, CodingKey {
        case repositoryName = "name"
        case language
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        repositoryName = try values.decodeIfPresent(String.self, forKey: .repositoryName)
        language = try values.decodeIfPresent(String.self, forKey: .language)

    }

}



