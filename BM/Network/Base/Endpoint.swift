//
//  EndPoint.swift
//  BM
//
//  Created by NikitaSergeevich on 06/08/2022.
//

import Foundation
import Combine
import CoreFoundation

protocol Endpoint {
    var schema: String {get}
    var host: String {get}
    var path: String {get}
    var method: RequestMethod {get}
    var header: [String: String]? {get}
    var body: [String: String]? {get}
}

extension Endpoint {
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return "192.168.0.103:8080"
//        127.0.0.1:8080
    }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decoed Error"
        case .unauthorized:
            return "Seeion expired"
        default:
            return "Unknow Error"
        }
    }
    
}
