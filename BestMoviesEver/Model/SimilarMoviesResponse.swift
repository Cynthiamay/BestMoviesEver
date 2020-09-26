//
//  SimilarMoviesResponse.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 25/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

struct SimilarMoviesResponse: Codable {
    let results: [Movies]
}

struct Movies: Codable {
    let title: String
//    let release_date: String
//    let poster_path: String
}
