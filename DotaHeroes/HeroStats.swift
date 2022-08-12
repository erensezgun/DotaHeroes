//
//  HeroStats.swift
//  DotaHeroes
//
//  Created by Eren on 7/31/22.
//

import Foundation

struct HeroStats : Decodable {
    
    let localized_name : String
    let primary_attr : String
    let attack_type : String
    let img : String
    let legs : Int
}
