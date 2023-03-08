//
//  NetworkManager.swift
//  MovieList_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case networkError
    case fetchError
    case parsingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() { }
    
    typealias networkCompletion = (Result<[Item], NetworkError>) -> Void
    
    func fetchData(word: String, completion: @escaping networkCompletion) {
        let unencodedUrlString = "\(Constants.urlString)?query=\(word)&display=50"
        guard let urlString = unencodedUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("urlString Error")
            return
        }
        getData(urlString: urlString) { result in
            completion(result)
        }
    }
    
    private func getData(urlString: String, completion: @escaping networkCompletion) {
        guard let url = URL(string: urlString) else {
            print("urlError")
            return
        }
        
        let session = URLSession(configuration: .default)

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Constants.apiId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(Constants.apiPW, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.networkError))
                print(error!)
                return
            }
            
            guard let safeData = data else {
                print("ERROR: Data Error")
                completion(.failure(.fetchError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("ERROR: Request Error")
                return
            }
            
            if let myData = self.parseJSON(safeData) {
                print("Success parse")
                completion(.success(myData))
            } else {
                print("Failed parse")
                completion(.failure(.parsingError))
            }
        }
        task.resume()
    }
    
    private func parseJSON(_ data: Data) -> [Item]? {
        do {
            let myData = try JSONDecoder().decode(Welcome.self, from: data)
            return myData.items
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
}


