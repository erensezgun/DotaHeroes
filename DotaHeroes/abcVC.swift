//
//  abcVC.swift
//  DotaHeroes
//
//  Created by Eren on 8/18/22.
//

import UIKit

class abcVC: UIViewController {

    var a: HeroStats?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(a?.localized_name)
        // Do any additional setup after loading the view.
    }
    
}
