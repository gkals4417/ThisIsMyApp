//
//  MainViewController.swift
//  EggTimer_Pulsar
//
//  Created by Hamin Jeong on 2023/02/23.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var rareImageView: UIImageView!
    @IBOutlet weak var welldoneImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearenceFunc()
        
        rareImageView.isUserInteractionEnabled = true
        rareImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(rareImageTapped)
            )
        )
        
        mediumImageView.isUserInteractionEnabled = true
        mediumImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(mediumImageTapped)
            )
        )
        
        welldoneImageView.isUserInteractionEnabled = true
        welldoneImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(welldoneImageTapped)
            )
        )

    }
    
    @objc private func rareImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "RareViewController") else { return }
            present(vc, animated: true)
        }
    }
    
    @objc private func mediumImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "MediumViewController") else { return }
            present(vc, animated: true)
        }
    }
    
    @objc private func welldoneImageTapped(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            guard let vc = self.storyboard?.instantiateViewController(identifier: "WelldoneViewController") else { return }
            present(vc, animated: true)
        }
    }
    
    private func appearenceFunc() {
        rareImageView.image = UIImage(named: "egg")
        mediumImageView.image = UIImage(named: "egg")
        welldoneImageView.image = UIImage(named: "egg")
    }

}
