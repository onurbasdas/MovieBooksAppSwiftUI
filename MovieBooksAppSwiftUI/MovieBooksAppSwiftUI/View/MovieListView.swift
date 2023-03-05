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
        self.movieListViewModel.getMovieSearch(movieName: "titanic")
    }
    
    var body: some View {
        NavigationView {
            List(movieListViewModel.movies, id: \.imdbId) { movie in
                HStack {
                    SpecialImage(url: movie.poster)
                        .frame(width: 100, height: 150)
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.title3)
                            .bold()
                        Text(movie.year)
                            .foregroundColor(.red)
                    }
                }
            }.navigationTitle("Movie List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
