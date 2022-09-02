//
//  MoviesListTileView.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import SwiftUI
import Kingfisher

struct MoviesListTileView: View {
    var imageName: String
    
    var body: some View {
        let imageName = (NetworkManager.ImageBaseUrl + imageName)
        if let imgUrl = URL(string: imageName) {
            KFImage(imgUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: Constants.PlaceHolderMoviePosterSystemImg)
        }
    }
}

struct MoviesListTileView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListTileView(imageName: "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg")
    }
}
