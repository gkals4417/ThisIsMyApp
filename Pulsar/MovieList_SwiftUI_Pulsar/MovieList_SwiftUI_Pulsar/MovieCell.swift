//
//  MovieCell.swift
//  MovieList_SwiftUI_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import SwiftUI

struct MovieCell: View {
    
    var movieTitle: String
    var imageURL: String {
        didSet {
            loadImage()
        }
    }
    @State var image: UIImage
    
    func loadImage() {
        guard let urlString = URL(string: imageURL) else {return}
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: urlString) else { return }
            guard imageURL == urlString.absoluteString else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage(systemName: "person")!
            }
        }
        
        
    }
    
    var body: some View {
        HStack(spacing: 150) {
            Image(uiImage: image)
                .resizable()
                .frame(width: 30, height: 30)
                .aspectRatio(1, contentMode: .fill)
            
            Text(movieTitle)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movieTitle: "반지의제왕", imageURL: "", image: UIImage(systemName: "person")!)
    }
}
