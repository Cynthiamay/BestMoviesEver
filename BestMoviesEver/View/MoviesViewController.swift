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
    let baseURL: String = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"
    
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
        tableView.contentInset = UIEdgeInsets(top: 350, left: 0, bottom: 0, right: 0)
        tableView.rowHeight = 110
        
        viewModel.fetchSimilarMovies { [weak self] in
            self?.viewModel.fetchMovieDetail { [weak self] in
                self?.tableView.dataSource = self
                self?.tableView.delegate = self
                self?.tableView.reloadData()
                if let poster = self?.viewModel.mainMovie?.poster_path,
                    let base = self?.baseURL {
                    self?.moviePoster.loadImageMovie(urlString: base + poster)
                }
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
        self.tableView.backgroundColor = .black
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
            let cell = tableView.dequeueReusableCell(for: indexPath,
                                                     cellType: DetailsTableViewCell.self)
            cell.setup(movieData: viewModel.mainMovie)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(for: indexPath,
                                                     cellType: SimilarMoviesViewCell.self)
            let movie = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCell(movie)
            cell.selectionStyle = .none
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 300)
        
        let height = min(max(y, 0), 400)
        
        moviePoster.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
        
    }
}

