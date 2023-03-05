//
//  DetailView.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    let imdbId : String
    
    @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            Text(movieDetailViewModel.movieDetails?.plot ?? "").onAppear {
                self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbId: "test")
    }
}
