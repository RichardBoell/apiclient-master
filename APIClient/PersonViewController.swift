//
//  PersonViewController.swift
//  APIClient
//
//  Created by Richard Boell on 30.05.16.
//  Copyright © 2016 iOS Dev Kurs Universität Heidelberg. All rights reserved.
//

// Configure view
//self.infoField.text = "Name: \(person!.name) \nYear of Birth: \(person!.birth_year) \nEyecolor: \(person!.eye_color)"



import UIKit
import Freddy
import Moya
import AlamofireImage


class PersonViewController: UIViewController {
    var swAPI: MoyaProvider<SWAPI>!
    
    var person: Person? {
        didSet {
            guard self.person!.name == "\(searchField.text!)" else {
                // solange person.name nicht mit dem gesuchten Namen übereinstimmt, weitersuchen
                if id == 16 { id += 1 } // id 17 überspringen da nicht existiert
                id += 1
                startAPIRequest(id)
                return
            }
            // Configure view
            self.infoField.text = "Name: \(person!.name) \nYear of Birth: \(person!.birth_year) \nEyecolor: \(person!.eye_color)"
            //reset id
            id = 1
            }
    }
    
    
    @IBOutlet var searchField: UITextField!
    @IBOutlet var infoField: UITextView!
    
    
    
    func startAPIRequest(id: Int) {
        swAPI.request(.person(id: id)) { result in
            print(result)
            switch result {
            case .Success(let response):
                do {
                    try response.filterSuccessfulStatusCodes()
                    let json = try JSON(data: response.data)
                    let person = try Person(json: json)
                    self
                    self.person = person
                    print(response)
                } catch {
                    print(error)
                    self.infoField.text = ("This person doesn't exist in the StarWars universe")
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    
    
    func textFieldShouldReturn(_: UITextField) -> Bool {
        startAPIRequest(id)
        return true
    }
    
    
}