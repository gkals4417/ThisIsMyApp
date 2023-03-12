//
//  SelectedView.swift
//  MovieList_Pulsar
//
//  Created by Hamin Jeong on 2023/03/08.
//

import UIKit

final class SelectedView: UIView {

    let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sizeToFit()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    let selectedTitleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 50
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
//        label.backgroundColor = .red
        return label
    }()
    
    let selectedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 50
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
//        label.backgroundColor = .blue
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(selectedImageView)
        stackView.addArrangedSubview(selectedTitleLable)
        stackView.addArrangedSubview(selectedDescriptionLabel)
        
        self.addSubview(stackView)
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            selectedImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 80),
            selectedImageView.widthAnchor.constraint(lessThanOrEqualToConstant: 80),
            
            selectedTitleLable.heightAnchor.constraint(equalToConstant: 20),
            selectedTitleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            selectedDescriptionLabel.heightAnchor.constraint(equalToConstant: 200),
            selectedDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
