//
//  NetworkManager.swift
//  GitHubMarketPlace
//
//  Created by Santhosh kumar on 9/17/19.
//  Copyright © 2019 santhosh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    enum URLPath: String {
        case users = "/search/users?q="
        case repos = "/users/%@/repos"
    }
    
    let baseURL = "https://api.github.com"
    
    static let shared: NetworkManager = NetworkManager()
   
    private init() {
        
    }
    
    func getSearchUsers(search name: String, handler: @escaping (_ response: UsersResponseModel?, _ error: Error?) -> Void) {
        let urlString = "\(baseURL)\(URLPath.users.rawValue)"
        
        Alamofire.request(urlString, method: .get, parameters: ["q": name])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
            switch response.result {
            case .success(let value):
                do {
                    let model = try JSONDecoder().decode(UsersResponseModel.self, from: value)
                    handler(model, nil)
                }catch {
                    
                }
            case .failure(let error):
                handler(nil, error)
            }
            
        }
    }
    
    func getUserRepos(search name: String, handler: @escaping (_ response: [RepositoryResponseModel]?, _ error: Error?) -> Void) {
        let urlString = "\(baseURL)/\("users")/\(name)/\("repos")"
        
        Alamofire.request(urlString, method: .get, parameters: ["q": name])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let model = try JSONDecoder().decode([RepositoryResponseModel].self, from: value)
                        handler(model, nil)
                    }catch {
                        
                    }
                case .failure(let error):
                    handler(nil, error)
                }
                
        }
    }
    
    func getUserFollow(search name: String, path: String, handler: @escaping (_ followers: Int?, _ error: Error?) -> Void) {
        let urlString = "\(baseURL)/\("users")/\(name)/\(path)"

        Alamofire.request(urlString, method: .get, parameters: ["q": name])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let model = try JSONSerialization.jsonObject(with: value, options: .mutableContainers) as? [Any]
                        
                        handler(model?.count, nil)
                    }catch {
                        
                    }
                case .failure(let error):
                    handler(nil, error)
                }
        }
    }
}
