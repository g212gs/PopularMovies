//
//  MovieDetailsView.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @StateObject var viewModel = MovieDetailViewModel()
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                if let movieDetail = self.viewModel.movieDetail {
                    MovieFullDetailView(movie: movieDetail)
                } else {
                    MovieSubDetailView(movie: movie)
                }
            }
        }
        .padding(.horizontal)
        .onAppear {
            if let movieId = movie.id {
                viewModel.getMovieDetail(ofMovieId: movieId)
            }
        }
    }
}



struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie())
    }
}
