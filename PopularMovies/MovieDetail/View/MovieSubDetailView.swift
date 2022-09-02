//
//  MovieSubDetailView.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import SwiftUI
import Kingfisher

struct MovieSubDetailView: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            let imageName = (NetworkManager.ImageBaseUrl + (movie.posterPath ?? ""))
            if let imgUrl = URL(string: imageName) {
                KFImage(imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image(systemName: Constants.PlaceHolderMoviePosterSystemImg)
            }
            HStack(alignment: .top, spacing: 0.0) {
                Text(movie.title ?? "")
                    .font(Font.headline.weight(.bold))
                    .frame(alignment: .leading)
                Spacer()
            }
            .padding(.vertical, 10.0)
            
            Text(movie.overview ?? "")
                .padding(.bottom, 10.0)
        }
    }
}

struct MovieSubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSubDetailView(movie: Movie())
    }
}
