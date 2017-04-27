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
//  func animalSelected(_ animal: Animal)
}

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?
	var manager: SHTreeViewManager?

//  var animals: Array<Animal>!
  
  struct TableView {
    struct CellIdentifiers {
      static let AnimalCell = "AnimalCell"
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
	let nib = UINib(nibName: "NodeTableViewCell", bundle: Bundle.main)
	tableView.register(nib, forCellReuseIdentifier: NodeTableViewCell.cellIdentifier)
	manager = SHTreeViewManager(tableView: tableView, cellIdentifier: NodeTableViewCell.cellIdentifier)
    let node1: Node<MenuNode> = Node(value: MenuNode(title: "Hello", imageURL: "www.google.com"), childrenNode: [
        Node(value: MenuNode(title: "World1"), childrenNode: [
			Node(value: MenuNode(title: "World11"), childrenNode: [
				Node(value: MenuNode(title: "World111"), childrenNode: []),
				Node(value: MenuNode(title: "World112"), childrenNode: []),
				])
			]),
		Node(value: MenuNode(title: "World2"), childrenNode: [
			Node(value: MenuNode(title: "World21"), childrenNode: []),
			Node(value: MenuNode(title: "World31"), childrenNode: [])
			
			])
		])
	manager?.reload(with: [node1])
  }
  
}
extension SidePanelViewController: TreeManagerDelegate {
    func manager(manager: SHTreeViewManager, didSelectNode node: TreeNode) {
        if let treeNode = node as? Node<MenuNode> {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let detailVc: AccountViewController = storyboard.instantiateViewController(withIdentifier: "AccountViewController") as! AccountViewController
            self.navigationController?.pushViewController(detailVc, animated: true)
            
        }
    }
}
// MARK: Table View Data Source

/*extension SidePanelViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.AnimalCell, for: indexPath) as! AnimalCell
    cell.configureForAnimal(animals[indexPath.row])
    return cell
  }
  
}

// Mark: Table View Delegate

extension SidePanelViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedAnimal = animals[indexPath.row]
    delegate?.animalSelected(selectedAnimal)
  }
  
}

class AnimalCell: UITableViewCell {
  
  @IBOutlet weak var animalImageView: UIImageView!
  @IBOutlet weak var imageNameLabel: UILabel!
  @IBOutlet weak var imageCreatorLabel: UILabel!
  
  func configureForAnimal(_ animal: Animal) {
    animalImageView.image = animal.image
    imageNameLabel.text = animal.title
    imageCreatorLabel.text = animal.creator
  }
  
}*/
