//
//  ContentView.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        self.movieListViewModel.getMovieSearch(movieName: "pulp")
    }
    
    var body: some View {
        List(movieListViewModel.movies, id: \.imdbId) { movie in
            Text(movie.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
