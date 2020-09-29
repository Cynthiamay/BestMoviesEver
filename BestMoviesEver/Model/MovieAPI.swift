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
    private var dataTask: URLSessionDataTask?
    let baseURL: String = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"
    let urlSimilar = "http://api.themoviedb.org/3/movie/497/similar?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR&page=1"
    
//    init(delegate: MoviesDatasourceDelegate?) {
//        self.delegate = delegate
//    }
    
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
//            print(json.id)
//            print(json.overview)
//            print(json.popularity)
//            print(json.poster_path)
//            print(json.title)
//            print(json.vote_count)
        })
        task.resume()
    }
    
    func getSimilarMovies(completion: @escaping (Result<SimilarMoviesResponse, Error>) -> Void) {
     
        guard let url = URL(string: urlSimilar) else {return}
     
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                print("Empty Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(SimilarMoviesResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
