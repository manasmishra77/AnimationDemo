//
//  Test2.swift
//  AnimationDemo
//
//  Created by Manas Mishra on 29/05/18.
//  Copyright © 2018 Manas Mishra. All rights reserved.
//

import UIKit

class Test2: NSObject {

    func startTest() {
        
    }
    func createATree(arr: [Int]) {
        for each in arr {
            let node = TreeNode(data: each, left: nil, right: nil)
        }
    }
    
    
}

class TreeNode {
    var data: Int
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    init(data: Int, left: TreeNode?, right: TreeNode?) {
        self.data = data
        self.leftNode = left
        self.rightNode = right
    }
}

class Tree {
    var root: TreeNode?
    //var prevNode: TreeNode?
    func insert(data: Int) {
        var temp = root
        if temp == nil {
            root = TreeNode(data: data, left: nil, right: nil)
            //prevNode = root
        } else {
            
        }
    }
}







