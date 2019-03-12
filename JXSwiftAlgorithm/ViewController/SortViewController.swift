//
//  SortViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class SortViewController: BaseTableViewController {
    var dataSource = [AlgorithmCellModel<AlgorithmSortType>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [
            AlgorithmCellModel(name: "冒泡排序", type: .maopao),
            AlgorithmCellModel(name: "选择排序", type: .selection),
            AlgorithmCellModel(name: "插入排序", type: .insert),
            AlgorithmCellModel(name: "希尔排序", type: .shellInsert),
            AlgorithmCellModel(name: "快速排序", type: .quick),
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
        case .maopao:
            SortMaster.bubble()
        case .selection:
            SortMaster.selection()
        case .insert:
            SortMaster.insert()
        case .shellInsert:
            SortMaster.shellInsert()
        case .quick:
            SortMaster.quick()
        }
    }
}

