//
//  SearchViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class SearchViewController: BaseTableViewController {
    var dataSource = [AlgorithmCellModel<AlgorithmSearchType>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [
            AlgorithmCellModel(name: "二分递归查找", type: .binaryRecursive),
            AlgorithmCellModel(name: "二分迭代查找", type: .binaryIterative),
            AlgorithmCellModel(name: "二维数组查找", type: .twoDimensionArray),
        ]
    }

    override func preferredDataSourceCount() -> Int {
        return dataSource.count
    }

    override func preferredItemName(at index: Int) -> String {
        return dataSource[index].name!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = dataSource[indexPath.row]
        
        switch cellModel.type! {
        case .binaryRecursive:
            SearchMaster.binarySearchRecursive()
        case .binaryIterative:
            SearchMaster.binarySearchIterative()
        case .twoDimensionArray:
            SearchMaster.twoDimensionArray()
        }
    }
}
