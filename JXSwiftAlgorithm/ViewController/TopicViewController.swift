//
//  TopicViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class TopicViewController: BaseTableViewController {
    var dataSource = [AlgorithmCellModel<AlgorithmTopicType>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [
            AlgorithmCellModel(name: "整数二进制1的个数", type: .binaryOneCount),
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
        case .binaryOneCount:
            TopicMaster.binaryOneCount()
        }
    }
}
