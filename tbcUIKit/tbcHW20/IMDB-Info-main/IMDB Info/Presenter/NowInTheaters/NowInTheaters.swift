//
//  ViewController.swift
//  IMDB Info
//
//  Created by Nika Topuria on 20.10.21.
//

import UIKit

final class NowInTheaters: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    private let movieManager = MovieManager()
    private var movies = [Movie]()
    private let nowInTheaters = "https://api.themoviedb.org/3/movie/now_playing?api_key=b688d2e3d40e21d185f1dd90d122a568&language=en-US&page=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieManager.fetchMovieList(with: nowInTheaters) { movielist in
            self.movies = movielist.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MovieCollectionVie", bundle: nil), forCellReuseIdentifier: "MovieCollectionView")
        tableView.register(UINib(nibName: "FeaturedCell", bundle: nil), forCellReuseIdentifier: "FeaturedCell")
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
}

extension NowInTheaters: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count/10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && movies.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell", for: indexPath) as! FeaturedCell
            cell.makeNew(movies[indexPath.row])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCollectionView", for: indexPath) as! MovieCollectionView
        cell.movies = self.movies
        cell.delegate = self
        return cell
    }
    
}

extension NowInTheaters: MovieCollectionViewDelegate {
    func openSelection(this vc: UIViewController) {
        self.present(vc, animated: true, completion: nil)
    }
}
