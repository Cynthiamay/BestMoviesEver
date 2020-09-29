//
//  SimilarMoviesViewCell.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 25/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Reusable

class SimilarMoviesViewCell: UITableViewCell, Reusable {
    
    
    
    private(set) var container = UIView()
    
    lazy var moviePoster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        poster.isAccessibilityElement = false
        poster.clipsToBounds = true
        poster.contentMode = .scaleAspectFit
        return poster
    }()
    
    lazy var lblTitle: UILabel = {
        let title = UILabel(frame: .zero)
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblYear: UILabel = {
        let title = UILabel(frame: .zero)
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblGenre: UILabel = {
        let title = UILabel(frame: .zero)
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    func setCell(_ movie: Movies) {
        updateUI(movieTitle: movie.title,
                 releaseDate: movie.release_date,
                 genre: movie.genre_ids)
    }
    
    private func updateUI(movieTitle: String,
                          releaseDate: String,
                          genre: [Int]) {
        setupViewConfiguration()
        
        self.lblTitle.text = movieTitle
    }
}

extension SimilarMoviesViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(container)
        container.addSubview(moviePoster)
        container.addSubview(lblTitle)
        container.addSubview(lblYear)
        container.addSubview(lblGenre)
    }
    
    func setupConstraints() {
        moviePoster.snp.makeConstraints { (make) in
            make.right.equalTo(container.snp.right).offset(5)
//            make.trailing.equalToSuperview().offset(1)
            make.top.equalTo(container.snp.top).offset(1)
            make.bottom.equalTo(container.snp.bottom).offset(-1)
        }
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        lblTitle.snp.makeConstraints { (make) in
            make.right.equalTo(moviePoster.snp.right).offset(5)
            make.top.equalTo(container.snp.top).offset(5)
            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblYear.snp.makeConstraints { (make) in
            make.right.equalTo(moviePoster.snp.right).offset(5)
            make.top.equalTo(container.snp.top).offset(7)
            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblGenre.snp.makeConstraints { (make) in
            make.right.equalTo(lblYear.snp.right).offset(1)
            make.top.equalTo(container.snp.top).offset(7)
            make.left.equalTo(container.snp.left).offset(-1)
        }
    }
    
    func configureViews() {
        container.backgroundColor = .clear
        moviePoster.backgroundColor = .clear
    }
}
