//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

struct MenuNode {
    var title: String
    var imageURL: String? = nil
    init(title: String) {
        self.title = title
    }
    init(title: String, imageURL: String) {
        self.title = title
        self.imageURL = imageURL
    }
    
}
protocol SidePanelViewControllerDelegate {
	func nodeSelected(_ node: MenuNode)
}

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?
  var manager: SHTreeViewManager?
	
//  override func viewDidLoad() {
//    super.viewDidLoad()
//	let nib = UINib(nibName: "NodeTableViewCell", bundle: Bundle.main)
//	tableView.register(nib, forCellReuseIdentifier: NodeTableViewCell.cellIdentifier)
//	manager = SHTreeViewManager(tableView: tableView, cellIdentifier: NodeTableViewCell.cellIdentifier)
//	manager?.treeDelegate = self
//    let node1: Node<MenuNode> = Node(value: MenuNode(title: "Hello1", imageURL: "www.google.com"), childrenNode: [
//        Node(value: MenuNode(title: "World1"), childrenNode: [
//			Node(value: MenuNode(title: "World11"), childrenNode: [
//				Node(value: MenuNode(title: "World111"), childrenNode: []),
//				Node(value: MenuNode(title: "World112"), childrenNode: []),
//				])
//			]),
//		Node(value: MenuNode(title: "World2"), childrenNode: [
//			Node(value: MenuNode(title: "World21"), childrenNode: []),
//			Node(value: MenuNode(title: "World31"), childrenNode: [])
//			
//			])
//		])
//    let node2: Node<MenuNode> = Node(value: MenuNode(title: "Hello2", imageURL: "www.google.com"), childrenNode: [
//        Node(value: MenuNode(title: "World2"), childrenNode: [
//            Node(value: MenuNode(title: "World21"), childrenNode: [
//                Node(value: MenuNode(title: "World211"), childrenNode: []),
//                Node(value: MenuNode(title: "World212"), childrenNode: []),
//                ])
//            ]),
//        Node(value: MenuNode(title: "World3"), childrenNode: [
//            Node(value: MenuNode(title: "World31"), childrenNode: []),
//            Node(value: MenuNode(title: "World41"), childrenNode: [])
//            
//            ])
//        ])
//	manager?.reload(with: [node1, node2])
//  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NodeTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: NodeTableViewCell.cellIdentifier)
        manager = SHTreeViewManager(tableView: tableView, cellIdentifier: NodeTableViewCell.cellIdentifier)
        manager?.treeDelegate = self
       
        let categoryModelData: [[String: Any]] = dummyData()["data"] as! [[String : Any]]
        let categoryModels = categoryModelData.map { dict in
            CategoryModel(dictionary: dict)
        }
        let nodes = categoryModels.map({ $0.categoryNode() })
        manager?.reload(with: nodes)
        
    }

    func dummyData() -> [String: Any] {
        guard let filePath = Bundle.main.path(forResource: "Data", ofType: "txt") else {
            return [:]
        }
        guard let myDictData = NSData(contentsOfFile: filePath) else {
            return [:]
        }
        let myDictionary = try!
            JSONSerialization.jsonObject(with: myDictData as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
        print(myDictionary)
        return myDictionary as! [String : Any]
    }
}

  


extension SidePanelViewController: TreeManagerDelegate {
    func manager(manager: SHTreeViewManager, didSelectNode node: TreeNode) {
        if let treeNode = node as? Node<MenuNode> {
           delegate?.nodeSelected(treeNode.value)
        }
    }
}
