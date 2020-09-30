//
//  DetailsTableViewCell.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 25/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import Reusable

class DetailsTableViewCell: UITableViewCell, Reusable {
    
    var movieData: DetailMovieResponse?
    
    private(set) var container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 446))

    lazy var lblTitle: UILabel = {
       let title = UILabel()
        title.textColor = UIColor.white
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblViews: UILabel = {
       let title = UILabel()
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var lblLikes: UILabel = {
        let title = UILabel()
        title.textColor = UIColor.red
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var btnHeart: UIButton = {
       let btn = UIButton(frame: .zero)
        btn.setTitle("♡", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(fillHeart), for: .touchUpInside)
        btn.isAccessibilityElement = true
        return btn
    }()
    
    @objc
    func fillHeart() {
        if btnHeart.isSelected == false {
            btnHeart.setTitle("♥️", for: .normal)
            btnHeart.isSelected = true
        } else {
            btnHeart.setTitle("♡", for: .normal)
        }
    }
    
    func setup(movieData: DetailMovieResponse?) {
        self.movieData = movieData
        update(movieTitle: movieData?.title,
               popularity: movieData?.popularity,
               voteCount: movieData?.vote_count)
    }
    
    func update(movieTitle: String?,
                popularity: Float?,
                voteCount: Int?) {
        setupViewConfiguration()
        
        self.lblTitle.text = movieTitle
        self.lblLikes.text = "\(String(describing: popularity))"
        self.lblViews.text = "\(String(describing: voteCount))"
        
    }
}

extension DetailsTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(container)
        container.addSubview(lblTitle)
        container.addSubview(btnHeart)
        container.addSubview(lblViews)
        container.addSubview(lblLikes)
    }
    
    func setupConstraints() {

        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        lblTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
//            make.top.equalTo(moviePoster.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        btnHeart.snp.makeConstraints { (make) in
            make.centerY.equalTo(container.snp.centerY)
            make.trailing.equalTo(container).offset(-16)
        }
        
        lblLikes.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom).offset(10)
            make.leading.equalTo(container).offset(16)
        }
        
        lblViews.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom).offset(10)
            make.trailing.equalTo(container).offset(-16)
        }
    }
    
    func configureViews() {
        container.backgroundColor = .black
//        moviePoster.backgroundColor = .red
    }
}
