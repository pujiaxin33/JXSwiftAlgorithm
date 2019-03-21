//
//  BinarySortTreeViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/21.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class BinarySortTreeViewController: BaseTableViewController {
    var dataSource = [AlgorithmCellModel<AlgorithmBinarySortTreeType>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [
            AlgorithmCellModel(name: "查找某个元素", type: .search),
            AlgorithmCellModel(name: "查找目标index的node", type: .searchNodeAtIndex),
            AlgorithmCellModel(name: "先序遍历", type: .preIterate),
            AlgorithmCellModel(name: "中序遍历", type: .middleIterate),
            AlgorithmCellModel(name: "后序遍历", type: .lastIterate),
            AlgorithmCellModel(name: "反转二叉树", type: .reverseTree),
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
        let rootNode = BinaryTreeMaster.binarySortTree()
        switch cellModel.type! {
        case .search:
            let result = BinaryTreeMaster.search(tree: rootNode, target: 1)
            print(result)
        case .searchNodeAtIndex:
            let node = BinaryTreeMaster.treeNode(at: 2, rootNode:   rootNode)
            print(node ?? TreeNode())
        case .preIterate:
            BinaryTreeMaster.preIterateTree(node: rootNode) { (node) in
                print(node.value)
            }
        case .middleIterate:
            BinaryTreeMaster.middleIterateTree(node: rootNode) { (node) in
                print(node.value)
            }
        case .lastIterate:
            BinaryTreeMaster.lastIterateTree(node: rootNode) { (node) in
                print(node.value)
            }
        case .reverseTree:
            BinaryTreeMaster.reverseTree(node: rootNode)
        }
    }
}
