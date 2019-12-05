//
//  LinkedListMaster.swift
//  JXSwiftAlgorithm
//
//  Created by jiaxin on 2019/7/19.
//  Copyright © 2019 jiaxin. All rights reserved.
//

import Foundation
import UIKit

//struct LinkedList<T: Equatable> {
//    var value: T
//    var
//}

class Node<T: Equatable> {
    var value: T
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}

class LinkedListMaster {
    static func reverseSingleLinkedList<Element>(headNode: Node<Element>) -> Node<Element> {
        var prevNode: Node<Element>?
        var currentNode: Node<Element>? = headNode
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
        }
        return prevNode!
    }
}
