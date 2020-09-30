//
//  ViewConfiguration.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 23/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation

protocol ViewConfiguration: class {
    func setupViewConfiguration()
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
