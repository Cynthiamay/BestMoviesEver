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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        setupViewConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setTableViewDelegates() {
        tableView?.register(cellType: DetailsTableViewCell.self)
        tableView?.rowHeight = 100

        datasource = MoviesDatasourceDelegate(tableView: tableView ?? UITableView())
        self.tableView?.dataSource = datasource
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
