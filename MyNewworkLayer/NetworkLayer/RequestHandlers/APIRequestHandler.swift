//
//  APIManager.swift
//  SwiftCairo-App
//  MyNewworkLayer
//
//  Created by Adam on 7/23/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import Foundation
import Alamofire



/// Response completion handler beautified.
typealias CallResponse<T> = ((ServerResponse<T>) -> Void)?


/// API protocol, The alamofire wrapper
protocol APIRequestHandler: HandleAlamoResponse {
    
    /// Calling network layer via (Alamofire), this implementation can be replaced anytime in one place which is the protocol itsel, applied everywhere.
    ///
    /// - Parameters:
    ///   - decoder: Codable confirmed class/struct, Model.type.
    ///   - completion: Results of the request, general errors cases handled.
    /// - Returns: Void.
    func send<T: CodableInit>(_ decoder: T.Type, completion: CallResponse<T>)
}

extension APIRequestHandler where Self: URLRequestConvertible {

    func send<T: CodableInit>(_ decoder: T.Type, completion: CallResponse<T>) {
        request(self).validate().responseData {(response) in
            self.handleResponse(response, completion: completion)
        }
    }
    
    
    func sendNative<T: CodableInit>(_ decoder: T.Type, completion: CallResponse<T>) {
        URLSession.shared.dataTask(with: try! self.asURLRequest()) { (data, url, error) in
            self.handleResponseNative(data: data, response: url, error: error, completion: completion)
        }.resume()
    }
}










