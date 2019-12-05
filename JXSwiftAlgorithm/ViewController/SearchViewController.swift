//
//  SearchViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class SearchViewController: BaseTableViewController<SearchAlgorithm> {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [.binaryRecursive, .binaryIterative, .twoDimensionArray, .rotateBinarySearch]
    }

    override func didSelectRow(with type: SearchAlgorithm) {
        switch type {
        case .binaryRecursive:
            SearchMaster.binarySearchRecursive()
        case .binaryIterative:
            SearchMaster.binarySearchIterative()
        case .twoDimensionArray:
            SearchMaster.twoDimensionArray()
        case .rotateBinarySearch:
//            let numbers = [4, 5, 6, 7, 8, 9, 0, 1, 2, 3]
            let numbers = [3, 1]
            let index = SearchMaster.rotateBinarySearch(nums: numbers, target: 1)
            print(index)
        }
    }
}
