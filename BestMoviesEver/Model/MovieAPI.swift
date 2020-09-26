//
//  MovieAPI.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 24/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

public class MovieAPI {
    
    weak var delegate: MoviesDatasourceDelegate?
    let baseURL: String = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"
    
    init(delegate: MoviesDatasourceDelegate?) {
        self.delegate = delegate
    }

    func getMovieDetails(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: DetailMovieResponse?
            do {
                result = try JSONDecoder().decode(DetailMovieResponse.self, from: data)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            self.delegate?.title = json.title
            self.delegate?.urlImage = self.baseURL + json.poster_path
//            print(json.id)
//            print(json.overview)
//            print(json.popularity)
//            print(json.poster_path)
//            print(json.title)
//            print(json.vote_count)
        })
        task.resume()
    }
    
    func getSimilarMovies(from url: String) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: SimilarMoviesResponse?
            do {
                result = try JSONDecoder().decode(SimilarMoviesResponse.self, from: data)
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
//            print(json.results.description)
            print(json.results.debugDescription)
//            print(json.results)
//            self.delegate?.titleSimilarMovies = json.results[0]
        })
        task.resume()
    }

    

}
