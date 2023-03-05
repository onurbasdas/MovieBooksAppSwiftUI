//
//  DownloaderClient.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import Foundation

class DownloaderClient {
    
    
    func downloadMovies(search: String, completion: @escaping (Result<[Movie]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=85405b96") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GetMovies.self, from: data) else {
                return completion(.failure(.veriGelmedi))
            }
            
            completion(.success(filmCevabi.movies))
            
        }.resume()
    }
}


enum DownloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}
