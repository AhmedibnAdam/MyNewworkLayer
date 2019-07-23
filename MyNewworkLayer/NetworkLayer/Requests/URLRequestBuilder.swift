//
//  RequestBuilderProtocol.swift
//  MyNewworkLayer
//
//  Created by Adam on 7/23/19.
//  Copyright © 2019 Adam. All rights reserved.
//

import Foundation
import Alamofire


// This protocole for Network Request must be confirm to make request
protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    // Base Backend Url
    var mainURL: URL { get }
    // Request Url
    var requestURL: URL { get }
    
    // MARK: - Path
    var path: String { get }
    
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var deviceId: String { get }
    
    // last shape of URL
    var urlRequest: URLRequest { get }
    
}


extension URLRequestBuilder {
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        case .post:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var mainURL: URL  {
        return URL(string: "https://live.mysite.com")!
    }
    
    var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }
    var defaultParams: Parameters {
        var param = Parameters()
        param["app_lang"] =  "en"
        param["mobile_id"] = deviceId
        return param
    }
    
    var deviceId: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        return request
    }
    
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}
