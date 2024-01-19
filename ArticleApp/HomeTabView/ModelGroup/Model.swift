//
//  Model.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import Foundation

struct TopStoriesModel: Codable{
    let results: [TopStoriesProperties]?
}

struct TopStoriesProperties: Codable{
    let subsection: String?
    let title: String?
    let abstract: String?
}
