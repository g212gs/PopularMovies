//
//  MovieFullDetailView.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import SwiftUI
import Kingfisher

struct MovieFullDetailView: View {
    var movie: MovieDetail
    
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
            HStack(alignment: .center, spacing: 0.0) {
                Text(movie.title ?? "")
                    .font(Font.headline.weight(.bold))
                    .frame(alignment: .leading)
                Spacer()
                Text(movie.status ?? "")
                    .padding(.all, 10.0)
                    .border(.gray, width: 2)
            }
            .padding(.vertical, 10.0)
            
            HStack(alignment: .top, spacing: 0.0) {
                Text("\(Constants.TagLinePrefix) + \(movie.tagline ?? "")")
                    .italic()
                    
                Spacer()
            }
            .padding(.bottom, 10.0)
            
            Text(movie.overview ?? "")
                .padding(.bottom, 10.0)
        }
    }
}

struct MovieFullDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieFullDetailView(movie: MovieDetail())
    }
}
