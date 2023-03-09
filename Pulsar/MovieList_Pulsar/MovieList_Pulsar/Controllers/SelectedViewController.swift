//
//  SelectedViewController.swift
//  MovieList_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import UIKit

final class SelectedViewController: UIViewController {

    let selectedView = SelectedView()
    
    var movieDataFromMainVC: Item? {
        didSet {
            print("Get Movie Data From MainVC")
        }
    }
    
    override func loadView() {
        view = selectedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageString = movieDataFromMainVC?.image else {return}
        DispatchQueue.global().async {
            if let imageURL = URL(string: imageString) {
                let image = try! Data(contentsOf: imageURL)
                DispatchQueue.main.async {
                    self.selectedView.selectedImageView.image = UIImage(data: image)
                }
                
            }
        }
        selectedView.selectedTitleLable.text = String(htmlEncodedString: movieDataFromMainVC?.title ?? "")
        selectedView.selectedDescriptionLabel.text = String(htmlEncodedString: movieDataFromMainVC?.subtitle ?? "")
        
       
    }


}
