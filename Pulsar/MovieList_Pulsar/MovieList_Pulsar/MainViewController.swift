//
//  ViewController.swift
//  MovieList_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import UIKit

class MainViewController: UIViewController {

    let networkManager = NetworkManager.shared
    let tableView = UITableView()
    
    var movieArrayFromAPI: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setTableView()
        setTableViewConstraints()
    }

    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func getAPIData(searchWord: String) {
        networkManager.fetchData(word: searchWord) { result in
            switch result {
            case .success(let tempDataArray):
                self.movieArrayFromAPI = tempDataArray
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.mainImageView.image = UIImage(systemName: "person")
        cell.titleLabel.text = "Hello"
        cell.descriptionLabel.text = "Description"

        return cell
    }
    
    
}
