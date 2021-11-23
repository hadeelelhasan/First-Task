//
//  InterCeptor.swift
//  FirstTask
//
//  Created by Hadeel El Hasan on 18/10/2021.
//

import Foundation
import Alamofire

// MARK: - Interceptor
class Interceptor: RequestInterceptor {
    
    /// Retry Limit
    let retryLimit = 5
    
    /// Retry Delay
    let retryDelay: TimeInterval = 10
    
    /**
     Retry
     - Parameters:
       - request: request as Request
       - session: session as Session
       - error: error as Error
       - completion: retry result
     */
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
        if let statusCode = response?.statusCode,
               statusCode != 200,
               request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
            return completion(.doNotRetry)
        }
    }
}
