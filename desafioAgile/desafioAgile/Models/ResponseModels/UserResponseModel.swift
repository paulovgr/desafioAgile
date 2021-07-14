//
//  UserResponseModel.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation

struct UserResponseModel: Decodable {
     let avatarUrl: String?
     let name: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name = "name"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
