//
//  NetworkCall.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import Foundation

struct NetworkCall{
    let session = URLSession.shared
    
    
    func fetchStories(url: URL) async throws -> TopStoriesModel? {
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let topStoriesModel = try jsonDecoder.decode(TopStoriesModel.self, from: data)
            return topStoriesModel
        }catch{
            throw error
        }
    }
    func fetchBooks(url: URL) async throws -> BookModel? {
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let bookModel = try jsonDecoder.decode(BookModel.self, from: data)
            return bookModel
        }catch{
            throw error
        }
    }
}
    
    
   
