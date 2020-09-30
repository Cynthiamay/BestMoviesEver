//
//  MovieViewModel.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 28/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    private var apiService = MovieAPI()
    private var similarMovies = [Movies]()
    var mainMovie: DetailMovieResponse?

    func fetchSimilarMovies(completion: @escaping () -> ()) {
        apiService.getSimilarMovies { (result) in
            switch result {
            case .success(let listOf):
                self.similarMovies = listOf.results
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func fetchMovieDetail(completion: @escaping () -> ()) {
        apiService.getMovieDetails { (result) in
            switch result {
            case .success(let success):
                self.mainMovie = success
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return similarMovies.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Movies {
        return similarMovies[indexPath.row]
    }
}
