//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import Foundation

class movieDetailViewModel{
    
    var movieDetailsAPIServiceObject = MovieDetailsAPIService()
    func callMovieDetailsAPI(id:Int64,completion:@escaping(MovieDetailsModel)->()){
        movieDetailsAPIServiceObject.callMovieDetailsAPI(id: id) { (movieDetailsObject) in
            completion(movieDetailsObject)
        }
    }
    
}
