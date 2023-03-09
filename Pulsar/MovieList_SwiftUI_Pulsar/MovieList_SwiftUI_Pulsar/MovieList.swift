//
//  MovieList.swift
//  MovieList_SwiftUI_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import SwiftUI

struct MovieList: View {
    
    let networkManager = NetworkManager.shared
    
    @State var movieArrayFromAPI: [Item] = [] {
        didSet {
            print("movieArrayFromAPI was changed.")
        }
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(movieArrayFromAPI, id: \.title) { item in
                    NavigationLink {
                        Text("Hello")
                    } label: {
                        MovieCell(movieTitle: item.title, imageURL: item.image, image: UIImage(systemName: "person")!)
                    }

                }
            }
            .navigationTitle("영화목록")
            .listStyle(.inset)
            .onAppear {
                networkManager.fetchData(word: "반지의제왕") { result in
                    switch result {
                    case .success(let data):
                        self.movieArrayFromAPI = data
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
