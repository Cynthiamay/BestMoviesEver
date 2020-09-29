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
    private var viewModel = MoviewViewModel()
    var resultados = [Movies]()
    
    var title: String = ""
    var titleSimilarMovies: String = ""
    var urlImage: String = ""
    
    lazy var moviePoster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        poster.isAccessibilityElement = false
        poster.clipsToBounds = true
        poster.contentMode = .scaleAspectFit
        poster.backgroundColor = UIColor.black
        return poster
    }()
    
    init(tableView: UITableView) {
        super.init()
        
        self.tableView = tableView
        tableView.contentInset = UIEdgeInsets(top: 500, left: 0, bottom: 0, right: 0)

    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailsTableViewCell.self)
            cell.setup(movieTitle: title)
//            cell.moviePoster.loadImageMovie(urlString: urlImage)
            print(title)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SimilarMoviesViewCell.self)
            let movie = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCell(movie)
            cell.moviePoster.loadImageMovie(urlString: urlImage)
            print(title)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 500 - (scrollView.contentOffset.y + 500)
        
        let height = min(max(y, 0), 700)
        
        moviePoster.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        moviePoster.loadImageMovie(urlString: urlImage)
    }
}
