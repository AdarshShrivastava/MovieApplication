//
//  MovieHomeViewModel.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import Foundation

class MovieHomeViewModel{
    var movieHomeAPIServiceObj = MovieHomeAPIService()
    
    func callMovieListApi(completion:@escaping([MovieHomeModel]) -> Void){
        movieHomeAPIServiceObj.callMovieListAPI { (movieListObject) in
            completion(movieListObject)
        }
    }
    
}
