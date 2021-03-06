//
//  MovieAPI.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 24/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

public class MovieAPI {
    
    private var dataTask: URLSessionDataTask?
    let urlSimilar = "http://api.themoviedb.org/3/movie/497/similar?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR&page=1"
    
    let urlDetails = "https://api.themoviedb.org/3/movie/497?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR"
    
    
    func getMovieDetails(completion: @escaping (Result<DetailMovieResponse?, Error>) -> Void) {

        guard let url = URL(string: urlDetails) else {return}

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
                let jsonData = try decoder.decode(DetailMovieResponse?.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
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
