//
//  MoviesDatasourceDelegate.swift
//  BestMoviesEver
//
//  Created by cynthia watanabe on 23/09/20.
//  Copyright © 2020 cynthia watanabe. All rights reserved.
//

import Foundation
import UIKit

class MoviesDatasourceDelegate: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView?
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailsTableViewCell.self)
            cell.setup(movieTitle: "teste")
            return cell
        }
        return UITableViewCell()
    }
    
    
}
