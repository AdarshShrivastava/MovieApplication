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
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieListCollectionView.delegate = self
        MovieListCollectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieDetailsViewControllerObject = storyboard?.instantiateViewController(withIdentifier: "MovieDetails")
        self.navigationController?.pushViewController(movieDetailsViewControllerObject!, animated: true)
    }
 
}

