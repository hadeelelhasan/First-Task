//
//  Router.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import Foundation
import Alamofire

// MARK: - Router
enum Router {
    case fetchUsers(parameters: Parameters)
    
  /// Base URL
  var baseURL: String {
    switch self {
    case .fetchUsers:
        return "https://gateway.harridev.com"
    }
  }

  /// Path
  var path: String {
    switch self {
    case .fetchUsers:
        return "/core/api/v1/harri_search/search_users"
    }
  }
    
 /// Method
  var method: HTTPMethod {
    switch self {
    case .fetchUsers:
      return .post
    }
  }
}

    
// MARK: - URLRequestConvertible
extension Router: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
    let url = try baseURL.asURL().appendingPathComponent(path)
    var request = URLRequest(url: url)
    request.method = method
    switch self {
    case .fetchUsers(let parameters):
            request = try JSONEncoding.default.encode(request, with: parameters)
    }
    return request
  }
}


