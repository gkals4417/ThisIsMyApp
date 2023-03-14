//
//  APIManager.swift
//  MovieList_MVVM_Pulsar
//
//  Created by Hamin Jeong on 2023/03/14.
//

import UIKit
import RxSwift
import RxCocoa

class APIManager: APIManagerType {
    
    static let shared = APIManager()
    
    private var apiID: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "APIKEY", ofType: "plist") else {
                fatalError("Couldn't find file 'APIKEY.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_ID") as? String else {
                fatalError("Couldn't find key 'API_ID' in 'APIKEY.plist'.")
            }
            return value
        }
    }
    
    private var apiPW: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "APIKEY", ofType: "plist") else {
                fatalError("Couldn't find file 'APIKEY.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_PW") as? String else {
                fatalError("Couldn't find key 'API_PW' in 'APIKEY.plist'.")
            }
            return value
        }
    }
    
    func fetchMovieData(searchTerm: String) -> Observable<[Item]> {
        let undecodedString = "https://openapi.naver.com/v1/search/movie.json?query=\(searchTerm)&display=50"
        guard let urlString = undecodedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("Failed Convert undecoded URL to decoded URL.")
            return Observable.error(NSError(domain: "convert_url", code: 0))
        }
        
        guard let url = URL(string: urlString) else {
            print("Failed URL")
            return Observable.error(NSError(domain: "invalid_url", code: 1))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(apiPW, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        return URLSession.shared.rx.data(request: request)
            .map { try JSONDecoder().decode(Welcome.self, from: $0).items}
            .asObservable()
    }
}
