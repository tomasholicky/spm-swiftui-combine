//
//  Coin.swift
//  
//
//  Created by Tomas Holicky on 13/05/2020.
//

public struct Coin: Codable, Identifiable {
    public var id: String
    public var symbol: String
    public var name: String
    public var image: CoinImage?
    
    
    public init(id: String, symbol: String, name: String, image: CoinImage?) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
    }
}
