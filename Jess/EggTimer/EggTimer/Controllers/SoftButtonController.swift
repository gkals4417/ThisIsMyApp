//
//  softController.swift
//  EggTimer
//
//  Created by juyeong koh on 2023/03/05.
//

import UIKit

class SoftButtonController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var softLabel: UILabel = {
       let label = UILabel()
        label.text = "반숙"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var timeSlider: UISlider = {
        let slider = UISlider()
        
            // 여기 해야함
        return slider
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helpers
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(softLabel)
        softLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }

}
