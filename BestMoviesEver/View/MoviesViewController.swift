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
    let urlDetails = "https://api.themoviedb.org/3/movie/497?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR"
    let urlSimilar = "http://api.themoviedb.org/3/movie/497/similar?api_key=f3ed49f55cf67d06db9ad41bccf247d4&language=pt-BR&page=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        setupViewConfiguration()
        MovieAPI(delegate: datasource).getMovieDetails(from: urlDetails)
        MovieAPI(delegate: datasource).getSimilarMovies(from: urlSimilar)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setTableViewDelegates() {
        tableView?.register(cellType: DetailsTableViewCell.self)
        tableView?.register(cellType: SimilarMoviesViewCell.self)

        tableView?.rowHeight = UITableView.automaticDimension

        datasource = MoviesDatasourceDelegate(tableView: tableView ?? UITableView())
        self.tableView?.dataSource = datasource
        self.tableView?.delegate = datasource
    }
}

extension MoviesViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        guard let tableViewGuarded = tableView else {
            fatalError("TableView need to exist")
        }
        self.view.addSubview(tableViewGuarded)
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
