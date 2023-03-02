//
//  Pokemon.swift
//  Pokemon
//
//  Created by Jack Smith on 01/03/2023.
//

import Foundation

struct Pokemon: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let other: Other
}

struct Other: Decodable {
    let officialArtwork: Artwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct Artwork: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
