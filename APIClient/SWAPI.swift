//
//  SWAPI.swift
//  APIClient
//
//  Created by Richard Boell on 30.05.16.
//  Copyright © 2016 iOS Dev Kurs Universität Heidelberg. All rights reserved.
//

import Foundation
import Moya


public var id:Int = 1

enum SWAPI: Moya.TargetType {
    
    
    case person(id: Int)
    
    var baseURL: NSURL { return NSURL(string: "http://swapi.co/api")! }
    
    var path: String {
        switch self {
        case .person(let id): return
            "/people/\(id)/"
        }
    }
    
    var method: Moya.Method { return .GET }
    
    var parameters: [String : AnyObject]? {
        switch self {
        default: return nil
        }
    }
    
    var sampleData: NSData {
        switch self {
        default: return "".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}