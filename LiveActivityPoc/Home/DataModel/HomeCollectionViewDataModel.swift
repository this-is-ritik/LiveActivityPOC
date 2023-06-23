//
//  HomeCollectionViewDataModel.swift
//  LiveActivityPoc
//
//  Created by Ritik Sharma on 24/06/23.
//

import Foundation


struct HomeData: Codable {
    public var list: [HomeCVList]?
}
struct HomeCVList: Codable {
    public var title: String?
    public var subTitle: String?
    public var style: Style?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode the optional properties
        title = try container.decodeIfPresent(String.self, forKey: .title)
        subTitle = try container.decodeIfPresent(String.self, forKey: .subTitle)
        style = try container.decodeIfPresent(Style.self, forKey: .style)
    }
    
    private enum CodingKeys: CodingKey {
        case title
        case subTitle
        case style
    }
}

struct Style: Codable {
    public var needShadow: Bool?
    public var bgColor: String?
    public var ctaColor: String?
    public var titleColor: String?
    public var subTitleColor: String?
    public var cornerRadius: CGFloat?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.needShadow = try container.decodeIfPresent(Bool.self, forKey: .needShadow)
        self.bgColor = try container.decodeIfPresent(String.self, forKey: .bgColor)
        self.ctaColor = try container.decodeIfPresent(String.self, forKey: .ctaColor)
        self.titleColor = try container.decodeIfPresent(String.self, forKey: .titleColor)
        self.subTitleColor = try container.decodeIfPresent(String.self, forKey: .subTitleColor)
        self.cornerRadius = try container.decodeIfPresent(CGFloat.self, forKey: .cornerRadius)
    }
    
    private enum CodingKeys: CodingKey {
        case needShadow
        case bgColor
        case ctaColor
        case titleColor
        case subTitleColor
        case cornerRadius
    }
}
