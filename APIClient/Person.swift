//
//  Person.swift
//  APIClient
//
//  Created by Richard Boell on 30.05.16.
//  Copyright © 2016 iOS Dev Kurs Universität Heidelberg. All rights reserved.
//

import Foundation
import Freddy
import UIKit

struct Person: JSONDecodable {
    
    // The name of the person
    let name: String
    // The year of birth of the person
    let birth_year: String
    // The persons eyecolor
    let eye_color: String
    
    
    init(json: JSON) throws {
        self.name = try json.string("name")
        self.birth_year = try json.string("birth_year")
        self.eye_color = try json.string("eye_color")
    }
    
}