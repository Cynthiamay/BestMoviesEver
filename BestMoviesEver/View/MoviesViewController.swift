//
//  MoviesViewController.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 23/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import UIKit
import SnapKit

class MoviesViewController: UIViewController {
    
    private var viewModel = MovieViewModel()
    var apiService = MovieAPI()
    
    let urlDetails = "https://api.themoviedb.org/3/movie/497?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR"
    var urlImage: String = ""
    
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var moviePoster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        poster.isAccessibilityElement = false
        poster.clipsToBounds = true
        poster.contentMode = .scaleAspectFit
        poster.backgroundColor = UIColor.black
        return poster
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        setupViewConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setTableViewDelegates() {
        tableView.register(cellType: DetailsTableViewCell.self)
        tableView.register(cellType: SimilarMoviesViewCell.self)
        tableView.contentInset = UIEdgeInsets(top: 500, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 150
        
        viewModel.fetchSimilarMovies { [weak self] in
            self?.viewModel.fetchMovieDetail { [weak self] in
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            }
        }
    }
}

extension MoviesViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
      
        self.view.addSubview(tableView)
        self.view.addSubview(moviePoster)
    }
    
    func setupConstraints() {
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func configureViews() {
        self.tableView.backgroundColor = .blue
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel.numberOfRowsInSection(section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailsTableViewCell.self)
            cell.setup(movieData: viewModel.mainMovie)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SimilarMoviesViewCell.self)
            let movie = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCell(movie)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 500 - (scrollView.contentOffset.y + 500)
        
        let height = min(max(y, 0), 700)
        
        moviePoster.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        moviePoster.loadImageMovie(urlString: urlImage)
    }
}

