//
//  ViewController.swift
//  DotaHeroes
//
//  Created by Eren on 7/31/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    
    var heroes = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApi{
            self.tableView.reloadData()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: Function
    
    func getApi(completion : @escaping () -> () ) {
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data , response , error in
            
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                    
                } catch {
                    print("Data Error")
                }
            }
            
        }
        .resume()
    }

}

// MARK: Extension

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellheroes", for: indexPath) as! HeroesCell
        let imgUrl = "https://api.opendota.com" + (heroes[indexPath.row].img)
        cell.heroImg.downloaded(from: imgUrl)
        cell.locaLbl.text = heroes[indexPath.row].localized_name
        cell.primaryLbl.text = heroes[indexPath.row].primary_attr
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showHeroesDetails", sender: self)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroesVC {
            destination.hero = heroes[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}


