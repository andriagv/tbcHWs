//
//  SearchViewController..swift
//  SearchViewController.
//
//  Created by Nika Topuria on 22.10.21.
//

import UIKit
import SkeletonView

final class SearchViewController: UIViewController {
    
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private weak var searchCollectionView: UICollectionView!
    private let movieManager = MovieManager()
    private var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        searchCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionViewCell")
        searchCollectionView.register(UINib(nibName: "CollectionViewHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionViewHeader")
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCollectionView.showAnimatedGradientSkeleton()
        let text = searchText
        if text.isEmpty {
            searchCollectionView.stopSkeletonAnimation()
            searchCollectionView.hideSkeleton()
            movies.removeAll()
        }
        let spacesFilteredText = text.replacingOccurrences(of: " ", with: "+")
        let searchQuary = movieManager.constructSearch(with: spacesFilteredText)
        movieManager.fetchMovieList(with: searchQuary) { movielist in
            self.movies = movielist.results
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.searchCollectionView.stopSkeletonAnimation()
                self.searchCollectionView.hideSkeleton()
                self.searchCollectionView.reloadData()
            })
        }
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchCollectionView.showAnimatedGradientSkeleton()
        if let text = searchBar.text {
            if text.isEmpty {
                searchCollectionView.stopSkeletonAnimation()
                searchCollectionView.hideSkeleton()
                movies.removeAll()
            }
            let spacesFilteredText = text.replacingOccurrences(of: " ", with: "+")
            let searchQuary = movieManager.constructSearch(with: spacesFilteredText)
            movieManager.fetchMovieList(with: searchQuary) { movielist in
                self.movies = movielist.results
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    self.searchCollectionView.stopSkeletonAnimation()
                    self.searchCollectionView.hideSkeleton()
                    self.searchCollectionView.reloadData()
                })
            }
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailsView") as! DetailsView
        let _ = vc.view
        vc.makeView(movies[indexPath.row])
        self.present(vc, animated: true)
    }
}


extension SearchViewController: SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "MovieCollectionViewCell"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if movies.count > 0 {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        cell.makeView(movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionViewHeader", for: indexPath) as! CollectionViewHeader
            headerView.makeNew(with: "Movies")
            return headerView
        }
        fatalError()
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.5 - 6, height: collectionView.frame.width * 0.5 * 1.4)
    }
}

