//
//  TopicViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class TopicViewController: BaseTableViewController<TopicAlgorithm> {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [.binaryOneCount]
    }

    override func didSelectRow(with type: TopicAlgorithm) {
        switch type {
        case .binaryOneCount:
            TopicMaster.binaryOneCount()
        }
    }
}
