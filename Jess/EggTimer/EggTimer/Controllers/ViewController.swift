//
//  ViewController.swift
//  EggTimer
//
//  Created by juyeong koh on 2023/02/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties

    private let eggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "egg")
        return imageView
    }()
    
    private let softButton: UIButton = {
        let button = UIButton()
        button.setTitle("반숙", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let mediumButton: UIButton = {
        let button = UIButton()
        button.setTitle("적당", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let hardButton: UIButton = {
        let button = UIButton()
        button.setTitle("완숙", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [softButton, mediumButton, hardButton])
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.distribution = .fillEqually
        return stackView
    }()
    

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemYellow
        
        view.addSubview(eggImageView)
        eggImageView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.top.equalToSuperview().offset(300)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
   
    }

}

