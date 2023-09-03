//
//  ImageData.swift
//  who is that pokemon
//
//  Created by brianchuquiruna on 23/06/23.
//

import Foundation

// MARK: - ImageData
struct ImageData: Codable {
    let sprites: Sprites?
}

// MARK: - Sprites
class Sprites: Codable {
    let other: Other?

    init(other: Other?) {
        self.other = other
    }
}

// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork?
    
    enum CodingKeys: String,CodingKey{
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String?
    
    enum CodingKeys: String,CodingKey{
        case frontDefault = "front_default"
    }
}





