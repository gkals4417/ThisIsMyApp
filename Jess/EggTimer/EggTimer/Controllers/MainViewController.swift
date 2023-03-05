//
//  ViewController.swift
//  EggTimer
//
//  Created by juyeong koh on 2023/02/22.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private var timer: Timer?
    private var totalTime: Int = 1
    private var passedTime: Int = 6
    private var isPaused: Bool = false

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
        button.addTarget(self, action: #selector(softButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let mediumButton: UIButton = {
        let button = UIButton()
        button.setTitle("적당", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(mediumButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let hardButton: UIButton = {
        let button = UIButton()
        button.setTitle("완숙", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(hardButtonTapped), for: .touchUpInside)
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
    
    // MARK: - Selectors
    
    @objc func softButtonTapped(_ sender: UIButton) {
        print("반숙 페이지로 넘기기")
        let vc = SoftButtonController()
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func mediumButtonTapped() {
        print("적당 페이지로 넘기기")
    }
    
    @objc func hardButtonTapped() {
        print("완숙 페이지로 넘기기")
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
            make.centerX.equalToSuperview()
            make.top.equalTo(self.eggImageView.snp.bottom).offset(20)
        }
    }
}

