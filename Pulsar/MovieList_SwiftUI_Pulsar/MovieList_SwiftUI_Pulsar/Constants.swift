//
//  Constants.swift
//  MovieList_SwiftUI_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import UIKit

public struct Constants {
    static let apiId: String = "c9dkbj09ka4QgoDDoQJS"
    static let apiPW: String = "bi24_3FkNx"
    static let urlString: String = "https://openapi.naver.com/v1/search/movie.json"
}

extension String {
    init?(htmlEncodedString: String) {
        guard let data = htmlEncodedString.data(using: .utf8) else { return nil }
    
        let options: [NSAttributedString.DocumentReadingOptionKey:Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        self.init(attributedString.string)
    }
}
