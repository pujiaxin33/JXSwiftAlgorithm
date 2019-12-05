//
//  SortViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class SortViewController: BaseTableViewController<SortAlgorithm> {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [.maopao, .selection, .insert, .shellInsert, .quick, .merge]
    }

    override func didSelectRow(with type: SortAlgorithm) {
        switch type {
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
        case .merge:
            SortMaster.merge()
        }
    }
}

