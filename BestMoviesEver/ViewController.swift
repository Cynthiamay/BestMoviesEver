//
//  ViewController.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 23/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = MoviesViewController()
        self.addChild(controller)
        view.addSubview(controller.view)
        controller.didMove(toParent:self)
    }


}

