//
//  ViewController.swift
//  MovieApp
//
//  Created by Adarsh Shrivastava on 19/09/18.
//  Copyright © 2018 Adarsh Shrivastava. All rights reserved.
//

import UIKit

class MovieHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var MovieListCollectionView: UICollectionView!
    
    var movieHomeViewModelObj = MovieHomeViewModel()
    var movieList = [MovieHomeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieListCollectionView.delegate = self
        MovieListCollectionView.dataSource = self
        callMovieListApi()
    }
    
    func callMovieListApi(){
        movieHomeViewModelObj.callMovieListApi { (movieListObject) in
            print(movieListObject)
            self.movieList = movieListObject
            DispatchQueue.main.async {
                self.MovieListCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return movieList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.movieTitle.text = movieList[indexPath.row].title
        if let imageLinkId = movieList[indexPath.row].imageLinkId{
        let movieThumbnailLink = "https://image.tmdb.org/t/p/w780" + imageLinkId
            let url = URL(string: movieThumbnailLink)
            let imageData = try? Data(contentsOf: url!)
        

        if let imageData = imageData{
            DispatchQueue.main.async {
                cell.movieThumbnailImage.image = UIImage(data: imageData)
            }
        }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailsViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as! MovieDetailsViewController
        movieDetailsViewControllerObject.selectedMovieId = movieList[indexPath.row].movieId
        self.navigationController?.pushViewController(movieDetailsViewControllerObject, animated: true)
    }
 
}

