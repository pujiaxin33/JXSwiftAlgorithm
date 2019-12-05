//
//  ViewController.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2018/11/8.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rootNode = Node(value: 1)
        let secondNode = Node(value: 2)
        rootNode.next = secondNode
        let thirdNode = Node(value: 3)
        secondNode.next = thirdNode
        let fourthNode = Node(value: 4)
        thirdNode.next = fourthNode
        let resultNode = LinkedListMaster.reverseSingleLinkedList(headNode: rootNode)
        
    }
}

extension ViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        }
    }
}

