//
//  NetworkCall.swift
//  ArticleApp
//
//  Created by WEMA on 18/01/2024.
//

import Foundation

struct NetworkCall{
    let session = URLSession.shared
    
    
<<<<<<< HEAD
    func fetchStories(url: URL) async throws -> TopStoriesModel? {
=======
    func fetch(url: URL) async throws -> TopStoriesModel? {
>>>>>>> refs/remotes/origin/main
        do {
            let (data, _) = try await session.data(from: url)
            let jsonDecoder = JSONDecoder()
            let topStoriesModel = try jsonDecoder.decode(TopStoriesModel.self, from: data)
            return topStoriesModel
        }catch{
            throw error
        }
    }
<<<<<<< HEAD
    func fetchBooks(url: URL) async throws -> BookModel? {
=======
}

struct NetworkCallTwo{
    let session = URLSession.shared
    
    
    func fetch(url: URL) async throws -> BookModel? {
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
    
    
   
=======
>>>>>>> refs/remotes/origin/main
