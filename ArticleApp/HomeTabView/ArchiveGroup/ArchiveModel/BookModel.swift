//
//  BookModel.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import Foundation



struct BookModel: Codable{
    var results: Results?
}

struct Results: Codable{
    var books: [BookProperties]?
}

struct BookProperties: Codable{
    let title: String?
    let description: String?
    let book_image: String?
    let author: String?
}
