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
    
    private let datePicker = UIDatePicker()
    
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [eggImageView, datePicker])
//        stackView.axis = .vertical
//        stackView.spacing = 20
//        stackView.distribution = .fillEqually
//        return stackView
//    }()
    

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
        
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(eggImageView.snp.bottom).offset(20)
            // View의 정중앙에 위치할 것
            make.center.equalToSuperview()
        }
    }

}

