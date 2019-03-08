//
//  BaseTableViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/8.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func preferredDataSourceCount() -> Int {
        return 0
    }

    func preferredItemName(at index: Int) -> String {
        return "unknown"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferredDataSourceCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = preferredItemName(at: indexPath.row)
        return cell
    }

}
