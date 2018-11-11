//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    var movieDetailsViewModelObject = movieDetailViewModel()
    var selectedMovieId : Int64?
    override func viewDidLoad() {
        super.viewDidLoad()
        callMovieDetailViewModel(id:selectedMovieId!)
    }
    
    func callMovieDetailViewModel(id :Int64){
        movieDetailsViewModelObject.callMovieDetailsAPI(id: id) { (movieDetailsObject) in
            DispatchQueue.main.async {
            self.movieTitle.text = movieDetailsObject.title
            self.movieOverview.text = movieDetailsObject.overview
            if let posterLinkId = movieDetailsObject.posterLinkId{
            let posterLink = "https://image.tmdb.org/t/p/w780" + posterLinkId
            let url = URL(string: posterLink)
            let imageData = try? Data(contentsOf: url!)
            if let imageData = imageData{
                
                    self.posterImage.image = UIImage(data: imageData)
                }
                }
            }
        }
    }

}
