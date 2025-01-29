//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Тадевос Курдоглян on 27.01.2025.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPersons(from url: URL, completion: @escaping(Result<Response, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let response = Response.getResponse(from: value) else { return }
                    completion(.success(response))
                case .failure(let error):
                    print("Ошибка загрузки данных: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}
