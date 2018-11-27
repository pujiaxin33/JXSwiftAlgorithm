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
    case maopaoSort
    case chooseSort
    case quickSort
    case binarySearch
}

struct AlgorithmCellModel {
    var name: String?
    var type: AlgorithmType?
}

class ViewController: UITableViewController {
    var dataSource = [AlgorithmCellModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [
            AlgorithmCellModel(name: "二分查找", type: .binarySearch),
            AlgorithmCellModel(name: "快速排序", type: .quickSort),
            AlgorithmCellModel(name: "选择排序", type: .chooseSort),
            AlgorithmCellModel(name: "冒泡排序", type: .maopaoSort),
            AlgorithmCellModel(name: "二维数组查找", type: .twoDimensionArrayFind),
        ]

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
        let sortedNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
//        let numbers = [3, 5, 1, 0, 9, 7, 8, 6, 4, 2]
        switch cellModel.type! {
        case .binarySearch:
//            let index = AlgorithmMaster.binarySearchRecursive(values: sortedNumbers, target: 9, range: 0..<sortedNumbers.count)
            let index = AlgorithmMaster.binarySearchIterative(values: sortedNumbers, target: 9)
            print(index ?? -1)
        case .twoDimensionArrayFind:
            AlgorithmMaster.testTwoDimensionArrayFind()
        case .maopaoSort:
            SortMaster.maopaoSort()
        case .chooseSort:
            SortMaster.chooseSort()
        case .quickSort:
            SortMaster.quickSort()
        }
    }
}

