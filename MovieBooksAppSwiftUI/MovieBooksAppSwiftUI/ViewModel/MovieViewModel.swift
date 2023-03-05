//
//  MovieViewModel.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import Foundation
import SwiftUI


class MovieListViewModel: ObservableObject {
    
    let downloaderClient = DownloaderClient()
    @Published var movies = [MovieViewModel]()
    
    func getMovieSearch(movieName: String) {
        downloaderClient.downloadMovies(search: movieName) { (result) in
            switch result {
            case .success(let success):
                if let success = success {
                    DispatchQueue.main.async {
                        self.movies = success.map(MovieViewModel.init)
                    }
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

struct MovieViewModel {
    let movie : Movie
    
    var title : String {
        movie.title
    }
    
    var poster : String {
        movie.poster
    }
    
    var year : String {
        movie.year
    }
    
    var imdbId : String {
        movie.imdbId
    }
}
