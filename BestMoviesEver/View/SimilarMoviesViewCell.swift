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
    
    private var baseURL: String = ""
    private(set) var container = UIView()
    
    lazy var moviePoster: UIImageView = {
        let poster = UIImageView()
        poster.isAccessibilityElement = false
        poster.clipsToBounds = true
        poster.contentMode = .scaleAspectFit
        return poster
    }()
    
    lazy var lblTitle: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
        title.font = title.font.withSize(18)
        title.numberOfLines = 2
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblYear: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
        title.font = title.font.withSize(18)
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblGenre: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.white
        title.font = title.font.withSize(18)
        title.isAccessibilityElement = true
        return title
    }()
    
    func setCell(_ movie: Movies) {
        updateUI(movieTitle: movie.title,
                 releaseDate: movie.release_date,
                 genre: movie.genre_ids,
                 poster: movie.poster_path)
    }
    
    private func updateUI(movieTitle: String,
                          releaseDate: String,
                          genre: [Int],
                          poster: String?) {
        setupViewConfiguration()
        
        self.lblTitle.text = movieTitle
        self.lblYear.text = convertDateRelease(releaseDate)
        
        guard let posterString = poster else {return}
        baseURL = "https://image.tmdb.org/t/p/w300" + posterString
        
        moviePoster.loadImageMovie(urlString: baseURL)
        
        self.lblGenre.text = convertToGetGenre(genre: Array(genre.prefix(2)))
        
    }

    func convertToGetGenre(genre: [Int]) -> String {
        var category = ""
        for i in genre {
            switch i {
            case 28:
                category = category + " Ação,"
            case 12:
                category = category + " Aventura,"
            case 16:
                category = category + " Animação,"
            case 35:
                category = category + " Comédia,"
            case 80:
                category = category + " Crime,"
            case 99:
                category = category + " Documentário,"
            case 18:
                category = category + " Drama,"
            case 10751:
                category = category + " Família,"
            case 14:
                category = category + " Fantasia,"
            case 36:
                category = category + " História,"
            case 27:
                category = category + " Horror,"
            case 10402:
                category = category + " Música,"
            case 9648:
                category = category + " Mistério,"
            case 10749:
                category = category + " Romance,"
            case 878:
                category = category + " Ficção científica,"
            case 10770:
                category = category + " Cinema TV,"
            case 53:
                category = category + " Thriller,"
            case 10752:
                category = category + " Guerra,"
            case 37:
                category = category + " Faroeste,"
            default:
                category = category + ""
            }
        }
        category = String(category.dropLast())
        return category
    }
    
    func convertDateRelease(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
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
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        moviePoster.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.leading.equalTo(self).offset(16)
            make.top.equalTo(container.snp.top).offset(5)
            make.bottom.equalTo(container.snp.bottom).offset(-5)
        }
        
        lblTitle.snp.makeConstraints { (make) in
            make.left.equalTo(moviePoster.snp.right).offset(10)
            make.right.equalTo(container.snp.right).offset(-15)
            make.top.equalTo(container.snp.top).offset(30)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblYear.snp.makeConstraints { (make) in
            make.left.equalTo(moviePoster.snp.right).offset(10)
            make.top.equalTo(lblTitle.snp.bottom).offset(8)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblGenre.snp.makeConstraints { (make) in
            make.left.equalTo(lblYear.snp.right).offset(1)
            make.top.equalTo(lblTitle.snp.bottom).offset(8)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
    }
    
    func configureViews() {
        container.backgroundColor = .black
        moviePoster.backgroundColor = .clear
    }
}
