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
    let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.placeholder = "HELLO"
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    var movieArrayFromAPI: [Item] = [] {
        didSet {
            print("변화!")
            print(movieArrayFromAPI.count)
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getAPIData(searchWord: "반지의 제왕") {
            
        }
        setTableView()
        setTableViewConstraints()
        setSearchBar()
    }

    func setSearchBar() {
        searchController.searchResultsUpdater = self
        navigationItem.title = "HELP"
        navigationItem.searchController = searchController
        self.navigationItem.title = "Search"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setTableViewConstraints() {
        tableView.rowHeight = 60
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func getAPIData(searchWord: String, completion: @escaping () -> Void) {
        networkManager.fetchData(word: searchWord) { result in
            switch result {
            case .success(let tempDataArray):
                self.movieArrayFromAPI = tempDataArray
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArrayFromAPI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImageView.image = UIImage(systemName: "person")
        cell.titleLabel.text = String(htmlEncodedString: movieArrayFromAPI[indexPath.row].title)
        cell.descriptionLabel.text = movieArrayFromAPI[indexPath.row].subtitle

        return cell
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchWord = searchController.searchBar.text else { return }
        getAPIData(searchWord: searchWord) {

        }
    }
    
    
}
