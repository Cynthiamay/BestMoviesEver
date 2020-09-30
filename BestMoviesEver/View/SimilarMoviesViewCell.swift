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
        title.font = title.font.withSize(20)
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblYear: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblGenre: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
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
        self.lblYear.text = releaseDate
        
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
                category = "Ação"
            case 12:
                category = "Aventura"
            case 16:
                category = "Animação"
            case 35:
                category = "Comédia"
            case 80:
                category = "Crime"
            case 99:
                category = "Documentário"
            case 18:
                category = "Drama"
            case 10751:
                category = "Família"
            case 14:
                category = "Fantasia"
            case 36:
                category = "História"
            case 27:
                category = "Horror"
            case 10402:
                category = "Música"
            case 9648:
                category = "Mistério"
            case 10749:
                category = "Romance"
            case 878:
                category = "Ficção científica"
            case 10770:
                category = "Cinema TV"
            case 53:
                category = "Thriller"
            case 10752:
                category = "Guerra"
            case 37:
                category = "Faroeste"
            default:
                category = ""
            }
        }
//        category = String(category.dropLast())
        return category
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
            make.top.equalTo(container.snp.top).offset(1)
            make.bottom.equalTo(container.snp.bottom).offset(-1)
        }
        
        lblTitle.snp.makeConstraints { (make) in
            make.left.equalTo(moviePoster.snp.right).offset(1)
            make.top.equalTo(container.snp.top).offset(16)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblYear.snp.makeConstraints { (make) in
            make.left.equalTo(moviePoster.snp.right).offset(1)
            make.top.equalTo(lblTitle.snp.bottom).offset(10)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
        lblGenre.snp.makeConstraints { (make) in
            make.left.equalTo(lblYear.snp.right).offset(1)
//            make.top.equalTo(container.snp.top).offset(7)
//            make.left.equalTo(container.snp.left).offset(-1)
        }
    }
    
    func configureViews() {
        container.backgroundColor = .black
        moviePoster.backgroundColor = .clear
    }
}
