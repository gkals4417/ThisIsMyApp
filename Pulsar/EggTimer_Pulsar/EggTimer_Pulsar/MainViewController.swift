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
        // Do any additional setup after loading the view.
    }
    
    private func appearenceFunc() {
        rareImageView.image = UIImage(systemName: "person.fill")
        mediumImageView.image = UIImage(systemName: "person.2")
        welldoneImageView.image = UIImage(systemName: "person.3")
    }

}
