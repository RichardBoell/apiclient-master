//
//  PersonViewController.swift
//  APIClient
//
//  Created by Richard Boell on 30.05.16.
//  Copyright © 2016 iOS Dev Kurs Universität Heidelberg. All rights reserved.
//

import UIKit
import Freddy
import Moya
import AlamofireImage


class PersonViewController: UIViewController {
    var swAPI: MoyaProvider<SWAPI>!
    
    var person: Person? {
        didSet {
            // Configure view
            self.infoField.text = "Name: \(person!.name) \nYear of Birth: \(person!.birth_year) \nEyecolor: \(person!.eye_color)"
            }
    }
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var infoField: UILabel!
    @IBAction func startSearch(sender: AnyObject) {
        
        while self.person!.name != "\(searchField.text)" {
            
            swAPI.request(.person(id: id)) { result in
                print(result)
                switch result {
                case .Success(let response):
                    do {
                        try response.filterSuccessfulStatusCodes()
                        let json = try JSON(data: response.data)
                        let person = try Person(json: json)
                        self.person = person
                        print(response)
                    } catch {
                        print(error)
                    }
                case .Failure(let error):
                    print(error)
                }
            }
            
            id += 1
        }
        
    }
    
    
    
    
    
}