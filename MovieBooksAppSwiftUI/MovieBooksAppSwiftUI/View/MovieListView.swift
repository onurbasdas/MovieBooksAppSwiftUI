//
//  ContentView.swift
//  MovieBooksAppSwiftUI
//
//  Created by Onur Başdaş on 5.03.2023.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel : MovieListViewModel
    @State var searchMovie = ""
    
    init() {
        self.movieListViewModel = MovieListViewModel()
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Aranacak Film", text: $searchMovie) {
                    self.movieListViewModel.getMovieSearch(movieName: searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }.padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(movieListViewModel.movies, id: \.imdbId) { movie in
                    
                    NavigationLink {
                        MovieDetailView(imdbId: movie.imdbId)
                    } label: {
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
                    }
                }.navigationTitle("Movie List")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
