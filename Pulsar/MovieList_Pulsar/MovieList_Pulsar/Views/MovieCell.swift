//
//  MovieCell.swift
//  MovieList_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import UIKit

final class MovieCell: UITableViewCell {
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        addSubview(mainImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
//        stackView.addArrangedSubview(descriptionLabel)
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 50),
            mainImageView.widthAnchor.constraint(equalToConstant: 50),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
//            descriptionLabel.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }

    
}
