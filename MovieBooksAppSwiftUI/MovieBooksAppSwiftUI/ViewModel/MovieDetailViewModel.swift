//
//  MovieDetailViewModel.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel : ObservableObject {
    
    @Published var movieDetails : MovieDetailsViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func getMovieDetail(imdbId : String) {
        
        downloaderClient.downloadMovieDetail(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetails = MovieDetailsViewModel(detail: movieDetail)
                }
                
            }
        }
        
    }
    
}

struct MovieDetailsViewModel {
    
    let detail : MovieDetail
    
    var title : String {
        detail.title
    }
    
    var poster : String {
        detail.poster
    }
    
    var year : String {
        detail.year
    }
    
    var imdbId : String {
        detail.imdbId
    }
    
    var director : String {
        detail.director
    }
    
    var writer : String {
        detail.writer
    }
    
    var awards : String {
        detail.awards
    }
    
    var plot : String {
        detail.plot
    }
    
}
