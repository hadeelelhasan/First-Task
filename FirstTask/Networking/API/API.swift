//
//  API.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import Foundation
import Alamofire

enum Parameter: String {
    case size
    case start
    case locations
}

// MARK: - API
class API {
    
    /// Shared
    static let shared = API()
    
    /// Manager Session
    let managerSession:  Session = {
        let interceptor = Interceptor()
        return Session(interceptor: interceptor) }()
    let parameters = Parameters()

    /**
     Default Initalizer
    */
    private init() {}
    

    /**
     Fetch Users
     - Parameters:
       - start: start index as Int
       - completion: response as Response
     */
    // fetchUserData
    func fetchData(from start: Int, completion: @escaping ([User]?, Int?) -> Void) {
        let parameters: Parameters = [Parameter.size.rawValue: 10,
                                      Parameter.start.rawValue: start,
                                      Parameter.locations.rawValue: [40.7127753, -74.0059728]]
        let request = managerSession.request(Router.fetchUsers(parameters: parameters))
//                let encoder = JSONEncoder()
//                encoder.outputFormatting = .prettyPrinted
//                var user = User()
//                if let userData = try? encoder.encode(user), let userString = String(data: userData , encoding: .utf8) {
//                    let defaults = UserDefaults.standard
//                        defaults.set(userData, forKey: "userData")
//
//                    print("userString \(userString)")
//                }
             
         request.responseData { dataResponse in
            guard let data = dataResponse.data,
                  let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                  let jsonDict = jsonObject as? [String: Any],
                  let jsonDataObj = jsonDict["data"] as? [String: Any], //dataClass
                  let usersObj = jsonDataObj["results"],
                  let hitsObj = jsonDataObj["hits"],
                  let usersData = try? JSONSerialization.data(withJSONObject: usersObj, options: [])
            else {
                completion(nil, nil)
                return
            }
            let decoder = JSONDecoder()
            //decoder.dateDecodingStrategy = .formatted(DateFormatter.dateFormatter)
            let users = try? decoder.decode([User].self, from: usersData)
            let hits = hitsObj as? Int
            completion(users, hits)
        }
        
        //
//        let decoder = JSONDecoder()
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//        var user = User()
//        if let userData = try? encoder.encode(user), let userString = String(data: userData , encoding: .utf8) {
//            let defaults = UserDefaults.standard
//                defaults.set(userData, forKey: "userData")
//
//            print("userString \(userString)")
//        }
        
//        decoder.dateDecodingStrategy = .formatted(DateFormatter.dateFormatter)
//        request.responseDecodable(of: Response.self, decoder: decoder ) { response in
//            guard let response = response.value else {
//                completion(nil)
//                return
//            }
//
//           // print(response.data.results[1].primaryPosition?.startDate)
//                completion(response)
//        }
    }
    
    func fetchUserInfo(withId id: Int, completion: @escaping (UserData?) -> Void) {
        
        let request = managerSession.request(Router.fetchUserInfo(userId: id))
        request.responseData { responseData in
            guard let data = responseData.data,
                  let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                  let jsonDict = jsonObject as? [String: Any],
                  let jsonDataObj = jsonDict["data"] as? [String: Any], 
                  let userData = try? JSONSerialization.data(withJSONObject: jsonDataObj, options: [])
            else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            let userInfo = try? decoder.decode(UserData.self, from: userData)
            completion(userInfo)
        }
    }
}


