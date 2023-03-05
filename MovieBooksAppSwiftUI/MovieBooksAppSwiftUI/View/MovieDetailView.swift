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
    
    var uiScreen = UIScreen.main.bounds
     
    
    var body: some View {
        VStack {
            
            let movieDetailCommon = movieDetailViewModel.movieDetails
            
            SpecialImage(url: movieDetailCommon?.poster ?? "").frame(width: uiScreen.width * 0.6, height: uiScreen.height * 0.3, alignment: .center)
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movieDetailCommon?.title ?? "Shows movie title.").padding().font(.title).bold()
                Text(movieDetailCommon?.plot ?? "Shows movie plot.").padding()
                Text("Yönetmen: \(movieDetailCommon?.director ?? "Shows director.")").padding()
                Text("Yazar: \(movieDetailCommon?.writer ?? "Shows writer.")").padding()
                Text("Ödüller: \(movieDetailCommon?.awards ?? "Shows awards.")").padding()
                Text("Yıl: \(movieDetailCommon?.year ?? "Shows year.")").padding()
            }
        }.onAppear {
            self.movieDetailViewModel.getMovieDetail(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbId: "test")
    }
}
