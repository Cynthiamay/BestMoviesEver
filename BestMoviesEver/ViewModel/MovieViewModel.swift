//
//  MovieViewModel.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 28/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

class MoviewViewModel {
    
    private var apiService = MovieAPI()
    private var similarMovies = [Movies]()
    
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
    
    func numberOfRowsInSection(section: Int) -> Int {
        if similarMovies.count != 0 {
            return similarMovies.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Movies {
        return similarMovies[indexPath.row]
    }
}
