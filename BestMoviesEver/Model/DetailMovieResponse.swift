//
//  DetailMovieResponse.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 25/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

struct DetailMovieResponse: Codable {
    
    let id: Int
    let overview: String
    let popularity: Float
    let title: String
    let poster_path: String
    let vote_count: Int
}
