//
//  ProjectRouter.swift
//  MyNewworkLayer
//
//  Created by Adam on 7/23/19.
//  Copyright © 2019 Adam. All rights reserved.
//



import Foundation
import Alamofire
//import AlamofireImage

// all actions made by user
enum UserRouter: URLRequestBuilder {

    case login(email: String, password: String)
    case register(email: String, password: String, phone: String)
    case phoneActivation (example: String)
    case resendPhoneActivation (example: String)
    case resendEmailLink (example: String)
    case resetPassword(example: String)
    case userInfo  (example: String)
    case updateInfo  (example: String)
    case userBalance (example: String)
    case search (example: String)
    
    // MARK: - Path
    internal var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "register"            
        case .phoneActivation:
            return "phoneActivation"
        case .resendPhoneActivation:
            return "resendPhoneActivation"
        case .resendEmailLink:
            return "resendEmailLink"
        case .resetPassword:
            return "resetPassword"
        case .userInfo:
            return "resetPassword"
        case .updateInfo:
            return "updateInfo"
        case .userBalance:
            return "userBalance"
        case .search:
            return "search"
        }
    }

    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters.init()
        switch self {
        case .login(let email, let password):
            params["email"] = email
            params["password"] = password
        case .register(let email, let password, let phone):
            params["email"] = email
            params["password"] = password
            params["phone"] = phone
        case .phoneActivation:
            params[""] = ""
        case .resendPhoneActivation:
            params[""] = ""
        case .resendEmailLink:
            params[""] = ""
        case .resetPassword:
            params[""] = ""
        case .userInfo:
            params[""] = ""
        case .updateInfo:
            params[""] = ""
        case .userBalance:
            params[""] = ""
        case .search:
            params[""] = ""
        }
        return params
    }
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
            
            // loign Method
        case .login:
            return .post
            
            // register Method
        case .register:
            return .post
            
            // phoneActivation Method
        case .phoneActivation:
            return .post
            
        case .resendPhoneActivation:
            return .post
            
        case .resendEmailLink:
            return .post
            
        case .resetPassword:
            return .post
            
        case .userInfo:
            return .post
            
        case .updateInfo:
            return .post
            
        case .userBalance:
            return .post
            
        case .search:
            return .post
        }
    }
    
    
    
   
}
