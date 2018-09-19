//
//  MovieDetailsAPIService.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import Foundation

class MovieDetailsAPIService{
    
    var movieDetailObject = MovieDetailsModel()
    func callMovieDetailsAPI(id:Int64, completion: @escaping(MovieDetailsModel) ->()){
        
        let idString = String(id)
        let str = "https://api.themoviedb.org/3/movie/" + idString + "?api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
        let url = URL(string: str)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else{return}
            guard let movieDetailsData = data else {return}
            do{
                let movieDetailsJson = try JSONSerialization.jsonObject(with: movieDetailsData, options: []) as! [String: Any]
                print(movieDetailsJson)
                self.movieDetailObject.title = movieDetailsJson["title"] as? String
                self.movieDetailObject.overview = movieDetailsJson["overview"] as? String
                self.movieDetailObject.posterLinkId = movieDetailsJson["backdrop_path"] as? String
                completion(self.movieDetailObject)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
