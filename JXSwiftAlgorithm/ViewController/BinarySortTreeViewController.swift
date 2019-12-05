//
//  BinarySortTreeViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/3/21.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import UIKit

class BinarySortTreeViewController: BaseTableViewController<BinaryTreeAlgorithm> {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = [.search, .searchNodeAtIndex, .preIterate, .middleIterate, .lastIterate, .reverseTree]
    }

    override func didSelectRow(with type: BinaryTreeAlgorithm) {
        let rootNode = BinaryTreeMaster.binarySortTree()
        switch type {
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
