//
//  ViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/8.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

enum AlgorithmType {
    case twoDimensionArrayFind
}

struct AlgorithmCellModel {
    var name: String?
    var type: AlgorithmType?
}

class ViewController: UITableViewController {
    var dataSource = [AlgorithmCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [AlgorithmCellModel(name: "二维数组查找", type: .twoDimensionArrayFind)]

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellModel = dataSource[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = cellModel.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = dataSource[indexPath.row]
        switch cellModel.type! {
        case .twoDimensionArrayFind:
            AlgorithmMaster.testTwoDimensionArrayFind()
        }
    }
}

