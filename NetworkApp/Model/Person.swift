//
//  Movie.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 18.01.2025.
//

import Foundation

struct Response: Decodable {
    let status: String
    let code: Int
    let locale: String
    let seed: String?
    let total: Int
    let data: [Person]
    
    init(responseDetails: [String: Any]) {
        status = responseDetails["status"] as? String ?? ""
        code = responseDetails["code"] as? Int ?? 0
        locale = responseDetails["locale"] as? String ?? ""
        seed = responseDetails["seed"] as? String ?? nil
        total = responseDetails["total"] as? Int ?? 0
        
        if let dataArray = responseDetails["data"] as? [[String: Any]] {
            data = dataArray.map { Person(personDetails: $0) }
        } else {
            data = []
        }
    }
    
    static func getResponse(from value: Any) -> Response? {
        guard let responseDict = value as? [String: Any] else { return nil }
        return Response(responseDetails: responseDict)
    }
}

struct Person: Decodable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let phone: String
    let birthday: String
    let gender: String
    let address: Address
    
    var fullname: String {
        "\(firstname) \(lastname)"
    }
    
    var description: String {
                """
                Email: \(email)
                Phone: \(phone)
                Birthdate: \(birthday)
                Adress: \(address.city), \(address.street), \(address.zipcode)
                """
    }
    
    init(personDetails: [String: Any]) {
        id = personDetails["id"] as? Int ?? 0
        firstname = personDetails["firstname"] as? String ?? ""
        lastname = personDetails["lastname"] as? String ?? ""
        email = personDetails["email"] as? String ?? ""
        phone = personDetails["phone"] as? String ?? ""
        birthday = personDetails["birthday"] as? String ?? ""
        gender = personDetails["gender"] as? String ?? ""
        
        if let addressDict = personDetails["address"] as? [String: Any] {
            address = Address(addressDetails: addressDict)
        } else {
            address = Address(addressDetails: [:])
        }
    }
    
    static func getPersons(from value: Any) -> [Person] {
        guard let personsDetails = value as? [[String: Any]] else { return [] }
        return personsDetails.map { Person(personDetails: $0) }
    }
}

struct Address: Decodable {
    let street: String
    let city: String
    let zipcode: String
    
    init(addressDetails: [String: Any]) {
        street = addressDetails["street"] as? String ?? ""
        city = addressDetails["city"] as? String ?? ""
        zipcode = addressDetails["zipcode"] as? String ?? ""
    }
}
