//
//  HeroesCell.swift
//  DotaHeroes
//
//  Created by Eren on 8/13/22.
//

import UIKit

class HeroesCell: UITableViewCell {
    
    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var locaLbl: UILabel!
    @IBOutlet weak var primaryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        heroImg.image = UIImage()
        heroImg.layer.borderColor = UIColor.red.cgColor
        heroImg.layer.borderWidth = 0.5
    }



}
