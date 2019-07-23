//
//  ProjectRouter.swift
//  SwiftCairo-App
//
//  Created by abdelrahman mohamed on 4/21/18.
//  Copyright © 2018 abdelrahman mohamed. All rights reserved.
//

import Foundation
import Alamofire

// all actions made by user
enum UserRouter: URLRequestBuilder {

    case login(email: String, password: String)
    case register(email: String, password: String, phone: String)
    case phoneActivation (email: String, password: String, phone: String)
    case resendPhoneActivation (email: String, password: String, phone: String)
    case resendEmailLink (email: String, password: String, phone: String)
    case resetPassword(email: String, password: String, phone: String)
    case userInfo  (email: String, password: String, phone: String)
    case updateInfo  (email: String, password: String, phone: String)
    case userBalance (email: String, password: String, phone: String)
    case search (email: String, password: String, phone: String)
    
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
