//
//  ViewController.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 18.01.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    private let url = URL(string: "https://fakerapi.it/api/v2/persons?_quantity=1&_gender=female&_birthday_start=2005-01-01")!


  
    @IBAction func getPersons() {
        fetchPerson()
    }
    
    private func fetchPerson() {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let persons = try JSONDecoder().decode(Response.self, from: data)
                print(persons)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

