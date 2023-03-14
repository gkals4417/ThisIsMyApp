//
//  APIManagerType.swift
//  MovieList_MVVM_Pulsar
//
//  Created by Hamin Jeong on 2023/03/14.
//

import UIKit
import RxSwift

protocol APIManagerType {
    func fetchMovieData(searchTerm: String) -> Observable<[Item]>
}
