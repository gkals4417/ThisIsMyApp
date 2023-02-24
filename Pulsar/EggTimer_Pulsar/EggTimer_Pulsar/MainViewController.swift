//
//  MainViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var rareImageView: UIImageView!
    @IBOutlet weak var welldoneImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearenceFunc()
        
        rareImageView.isUserInteractionEnabled = true
        rareImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rareImageTapped)))
        
        mediumImageView.isUserInteractionEnabled = true
        mediumImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mediumImageTapped)))
        
        welldoneImageView.isUserInteractionEnabled = true
        welldoneImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(welldoneImageTapped)))

    }
    
    @objc func rareImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print(sender.hashValue)
        }
    }
    
    @objc func mediumImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print(sender.hashValue)
        }
    }
    
    @objc func welldoneImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print(sender.hashValue)
        }
    }
    
    private func appearenceFunc() {
        rareImageView.image = UIImage(systemName: "person.fill")
        mediumImageView.image = UIImage(systemName: "person.2")
        welldoneImageView.image = UIImage(systemName: "person.3")
    }

}
