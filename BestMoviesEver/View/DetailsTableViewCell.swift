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
    
    private(set) var container = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 446))
    
//    lazy var moviePoster: UIImageView = {
//      let poster = UIImageView(frame: .zero)
//        poster.isAccessibilityElement = false
//        poster.clipsToBounds = true
//        poster.contentMode = .scaleAspectFit
//        return poster
//    }()
    
    lazy var lblTitle: UILabel = {
       let title = UILabel(frame: .zero)
        title.isAccessibilityElement = true
        return title
    }()
    
    func setup(movieTitle: String) {
        setupViewConfiguration()
        
        self.lblTitle.text = movieTitle
    }
}

extension DetailsTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
//        container.addSubview(moviePoster)
        container.addSubview(lblTitle)
    }
    
    func setupConstraints() {
//        moviePoster.snp.makeConstraints { (make) in
//            make.leading.equalToSuperview().offset(1)
//            make.trailing.equalToSuperview().offset(1)
//            make.bottom.equalToSuperview().offset(1)
//            make.top.equalToSuperview().offset(1)
//        }
        lblTitle.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func configureViews() {
        container.backgroundColor = .clear
    }
}
