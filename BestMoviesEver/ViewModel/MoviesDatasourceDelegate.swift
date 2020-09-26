//
//  MoviesDatasourceDelegate.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 23/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation
import UIKit

class MoviesDatasourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView?

    var title: String = ""
    var titleSimilarMovies: String = ""
    var urlImage: String = ""
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailsTableViewCell.self)
            cell.setup(movieTitle: title)
            cell.moviePoster.loadImageMovie(urlString: urlImage)
            print(title)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SimilarMoviesViewCell.self)
            cell.setup(movieTitle: title)
            cell.moviePoster.loadImageMovie(urlString: urlImage)
            print(title)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
