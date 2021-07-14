//
//  NetworkManager.swift
//  desafioAgile
//
//  Created by Paulo Victor Guimaraes Rosa on 12/07/21.
//

import Foundation
import Network

enum Result<T> {
    case success(T)
    case error(Error)
}
enum Endpoint: String {
    case repos = "/repos"
    case user = ""
}

public class NetworkManager {
    
    func request<T>(endpoint: Endpoint,
                    username: String,
                  completion: @escaping (Result<T>) -> Void) where T : Decodable {
        
        
        guard let url = makeURL(endpoint: endpoint, username: username) else {
            completion(.error(NSError()))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                return
            }

            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            } catch {
                completion(.error(error))
            }
        }
        task.resume()
    }
    
    func makeURL(endpoint: Endpoint, username: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users/\(username)\(endpoint.rawValue)"
        return components.url?.absoluteURL
    }
}


