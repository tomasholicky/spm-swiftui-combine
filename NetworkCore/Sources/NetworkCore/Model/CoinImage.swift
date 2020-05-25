//
//  CoinImage.swift
//  
//
//  Created by Tomas Holicky on 25/05/2020.
//

public struct CoinImage: Codable {
    public var thumb: String
    public var small: String
    public var large: String
    
    
    public init(thumb: String, small: String, large: String) {
        self.thumb = thumb
        self.small = small
        self.large = large
    }
    
    enum CodingKeys: String, CodingKey {
        case thumb = "thumb"
        case small = "small"
        case large = "large"
    }
}
