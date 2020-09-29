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
    
    private(set) var container = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 446))
    
//    lazy var moviePoster: UIImageView = {
//      let poster = UIImageView(frame: .zero)
//        poster.isAccessibilityElement = false
//        poster.clipsToBounds = true
//        poster.contentMode = .scaleAspectFit
//        return poster
//    }()
    
    lazy var lblTitle: UILabel = {
       let title = UILabel(frame: .zero)
        title.textColor = UIColor.blue
        title.isAccessibilityElement = true
        return title
    }()
    
    lazy var btnHeart: UIButton = {
       let btn = UIButton(frame: .zero)
        btn.setTitle("coracao", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
//        btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        btn.isAccessibilityElement = true
        return btn
    }()
    
    func setup(movieTitle: String) {
        setupViewConfiguration()
        
        self.lblTitle.text = movieTitle
    }
}

extension DetailsTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(container)
//        container.addSubview(moviePoster)
        container.addSubview(lblTitle)
    }
    
    func setupConstraints() {
//        moviePoster.snp.makeConstraints { (make) in
//            make.leading.equalToSuperview().offset(1)
//            make.trailing.equalToSuperview().offset(1)
//            make.bottom.equalToSuperview().offset(-30)
//            make.top.equalToSuperview().offset(1)
//        }
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
    }
    
    func configureViews() {
        container.backgroundColor = .clear
//        moviePoster.backgroundColor = .red
    }
}
