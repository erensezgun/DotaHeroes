//
//  HeroesVC.swift
//  DotaHeroes
//
//  Created by Eren on 7/31/22.
//

import UIKit

class HeroesVC: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var nameHeroLbl: UILabel!
    @IBOutlet weak var attrHeroLbl: UILabel!
    @IBOutlet weak var attackHeroLbl: UILabel!
    @IBOutlet weak var legsHeroLbl: UILabel!
    
    // MARK: Variables
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameHeroLbl.text = hero?.localized_name
        attrHeroLbl.text = hero?.primary_attr
        attackHeroLbl.text = hero?.attack_type
        legsHeroLbl.text = "\((hero?.legs)!)"
        
        let imgUrl = "https://api.opendota.com" + (hero?.img)!
        
        imgHero.downloaded(from: imgUrl)
        imgHero.layer.cornerRadius = 30
        title = hero?.localized_name
        config()
    }
    
    func config() {
        
        imgHero.layer.borderColor = UIColor.red.cgColor
        imgHero.layer.borderWidth = 0.7
        
        nameHeroLbl.layer.borderColor = UIColor.systemBlue.cgColor
        nameHeroLbl.layer.borderWidth = 1
        nameHeroLbl.layer.cornerRadius = 30
        
        attrHeroLbl.layer.borderColor = UIColor.systemBlue.cgColor
        attrHeroLbl.layer.borderWidth = 1
        attrHeroLbl.layer.cornerRadius = 30
        
        attackHeroLbl.layer.borderColor = UIColor.systemBlue.cgColor
        attackHeroLbl.layer.borderWidth = 1
        attackHeroLbl.layer.cornerRadius = 30
        
        legsHeroLbl.layer.borderColor = UIColor.systemBlue.cgColor
        legsHeroLbl.layer.borderWidth = 1
        legsHeroLbl.layer.cornerRadius = 30
    }
    

}

// MARK: Extension

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
