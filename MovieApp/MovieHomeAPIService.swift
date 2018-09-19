//
//  MovieHomeAPIService.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import Foundation

class MovieHomeAPIService{
    
    var movieList:[MovieHomeModel]?
    func callMovieListAPI(completion:@escaping([MovieHomeModel]) -> Void){
        
        let str = "https://api.themoviedb.org/3/movie/now_playing?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page=undefined"
        let url = URL(string: str)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, resonse, error) in
            guard error == nil else {return}
            guard  let movieData = data else{
                return
            }
            
            do{
                let movieJson = try JSONSerialization.jsonObject(with: movieData, options: []) as! [String:Any]
                //print(movieJson)
                let movieArray  = movieJson["results"] as! NSArray
                self.movieList = [MovieHomeModel]()
                for movie in movieArray{
                    var movieObject = MovieHomeModel()
                    let movieDictionary = movie as? NSDictionary
                    if let movieId = movieDictionary?["id"] as? Int64{
                        movieObject.movieId = movieId
                    }
                    if let movieThumbnailLinkId = movieDictionary?["backdrop_path"] as? String{
                        movieObject.imageLinkId = movieThumbnailLinkId
                    }
                    if let movieTitle = movieDictionary?["title"] as? String{
                        movieObject.title = movieTitle
                    }
                    self.movieList?.append(movieObject)
                }
                completion(self.movieList!)
            }
            catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
        // movieList = [MovieHomeModel]()
        //completion(movieList!)
    }
}
