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
    
    private(set) var tableView: UITableView? = UITableView(frame: .zero, style: .grouped)
    private(set) var datasource: MoviesDatasourceDelegate?
    private var viewModel = MoviewViewModel()
    var apiService = MovieAPI()
    let urlDetails = "https://api.themoviedb.org/3/movie/497?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        setupViewConfiguration()
        MovieAPI().getMovieDetails(from: urlDetails)
        apiService.getSimilarMovies { (result) in
            print(result)
        }
//        MovieAPI(delegate: datasource).getSimilarMovies(from: urlSimilar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setTableViewDelegates() {
        tableView?.register(cellType: DetailsTableViewCell.self)
        tableView?.register(cellType: SimilarMoviesViewCell.self)
        tableView?.contentInset = UIEdgeInsets(top: 500, left: 0, bottom: 0, right: 0)
        tableView?.rowHeight = UITableView.automaticDimension
        datasource = MoviesDatasourceDelegate(tableView: tableView ?? UITableView())
        self.tableView?.dataSource = datasource
        self.tableView?.delegate = datasource
        viewModel.fetchSimilarMovies { [weak self] in
            self?.tableView?.reloadData()
        }
    }
}

extension MoviesViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        guard let tableViewGuarded = tableView else {
            fatalError("TableView need to exist")
        }
        guard let data = datasource else {
            fatalError("TableView need to exist")
        }
        self.view.addSubview(tableViewGuarded)
        self.view.addSubview(data.moviePoster)
    }
    
    func setupConstraints() {
        self.tableView?.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func configureViews() {
        self.tableView?.backgroundColor = .blue
    }
}
