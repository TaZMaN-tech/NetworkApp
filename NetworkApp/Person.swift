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
}

struct Address: Decodable {
    let street: String
    let city: String
    let zipcode: String
}
