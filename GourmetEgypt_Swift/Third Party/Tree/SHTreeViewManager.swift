//
//  SHTreeViewManager.swift
//  SHTreeViewManager
//
//  Created by Susmita Horrow on 19/03/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import Foundation
import UIKit

protocol TreeNode {
	var children: [TreeNode] { get }
}
protocol TreeManagerDelegate: class {
    func manager(manager: SHTreeViewManager, didSelectNode node: TreeNode)
}
protocol NodeCell {
    func configure(with node: TreeNode, level: Int, expanded: Bool)
}

struct Node<T>: TreeNode {
	let value: T
	var childrenNode: [Node<T>]

	init(value: T, childrenNode: [Node<T>]) {
		self.value = value
		self.childrenNode = childrenNode
	}
	var children: [TreeNode] {
		return childrenNode
	}
	

}

class Tree {
	var treeNodes: [TreeNode]
	typealias NodeWithLevel = (node: TreeNode, level: Int)
	var visibleNodes: [NodeWithLevel] = []

	init(treeNodes: [TreeNode]) {
		self.treeNodes = treeNodes
		self.visibleNodes = treeNodes.map { NodeWithLevel(node: $0, level: 0) }
	}
	
	func expandNode(index: Int) -> [Int] {
		guard index < visibleNodes.count else {
			return []
		}
		let currentNode = visibleNodes[index]
		let childrenNodes = currentNode.0.children
		guard !childrenNodes.isEmpty else {
			return []
		}
		let elementsToBeInserted = childrenNodes.map { NodeWithLevel(node: $0, level: currentNode.level + 1)}
		visibleNodes.insert(contentsOf: elementsToBeInserted, at: index + 1)
		let arr: [Int] = (index+1...index+childrenNodes.count).map({$0})
		return arr
	}
	
	func collapseNode(index: Int) -> [Int] {
		guard index < visibleNodes.count else {
			return []
		}
		let childrenNodes = visibleNodes[index].0.children
		guard !childrenNodes.isEmpty else {
			return []
		}
		let indexArray: [Int] = visibleChildren(index: index)
		
		for indexToRemove in indexArray.sorted(by: { $0 > $1 }) {
			visibleNodes.remove(at: indexToRemove)
		}
		return indexArray
	}
	
	func visibleChildren(index: Int) -> [Int] {
		guard index < visibleNodes.count else {
			return []
		}
		let currentNode = visibleNodes[index]
		let childrenNodes = currentNode.0.children
		guard !childrenNodes.isEmpty else {
			return []
		}
		var indexArray: [Int] = []
		var nextIndex = index + 1
		while nextIndex < visibleNodes.count, visibleNodes[nextIndex].1 > currentNode.1 {
			indexArray.append(nextIndex)
			nextIndex += 1
		}
		return indexArray
	}
	
	func isExpanded(index: Int) -> Bool {
		guard index < visibleNodes.count else {
			return false
		}
		let childrenNodes = visibleNodes[index].0.children
		guard !childrenNodes.isEmpty else {
			return false
		}
		let nextIndex = index + 1
		let currentNode = visibleNodes[index]
		return nextIndex < visibleNodes.count && visibleNodes[nextIndex].1 == currentNode.1 + 1
	}
    //TO DO:
//    func getSibling(index:Int)-> [TreeNode] {
//        guard index < visibleNodes.count else {
//            return []
//        }
//        let childrenNodes = visibleNodes[index].0.children
//        guard !childrenNodes.isEmpty else {
//            return []
//        }
//    }
}

class SHTreeViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {
	private var tableView: UITableView!
	var nodes: [TreeNode] = []
	private(set) var cellIdentifier: String
	var tree: Tree
    weak var treeDelegate: TreeManagerDelegate?
	
	init(tableView: UITableView, cellIdentifier: String) {
		self.tableView = tableView
		self.cellIdentifier = cellIdentifier
		self.tree = Tree(treeNodes: [])
		super.init()
		self.tableView.dataSource = self
		self.tableView.delegate = self
	}
	
	func reload(with nodes: [TreeNode]) {
		self.nodes = nodes
		self.tree = Tree(treeNodes: nodes)
		self.tableView.reloadData()
	}
	
	func expandIndex(index: Int) {
		tableView.beginUpdates()
		let indexes = tree.expandNode(index: index)
		let indexPaths = indexes.map({ IndexPath(row: $0, section: 0) })
		tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
		tableView.endUpdates()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
	}
	
	func collapseIndex(index: Int) {
		tableView.beginUpdates()
		let indexesToRemove = tree.collapseNode(index: index)
		let indexPaths = indexesToRemove.map { IndexPath(row: $0, section: 0) }
		tableView.deleteRows(at: indexPaths, with: .automatic)
		tableView.endUpdates()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.tree.visibleNodes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
		if let cell = cell as? NodeCell {
			let node = tree.visibleNodes[indexPath.row]
            cell.configure(with: node.node, level: node.level, expanded: tree.isExpanded(index: indexPath.row))
        }
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let node = tree.visibleNodes[indexPath.row].0
		if  node.children.isEmpty  {
			treeDelegate?.manager(manager: self, didSelectNode: node)
		}
        else {
            if self.tree.isExpanded(index: indexPath.row) {
                self.collapseIndex(index: indexPath.row)
            } else {
                self.expandIndex(index: indexPath.row)
            }
        }
		
	}
}
