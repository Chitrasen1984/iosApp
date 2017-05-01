//
//  ItemCollectionManager.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 30/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

struct Item {
	var name: String
	var price: String
	var isFavorited: Bool
	var imageUrl: String
}

struct ItemSection {
	var name: String
	var items: [Item]
}

protocol ItemCollectionManagerProtocol {
	func manager(collectionManager: ItemCollectionManager, didSelectItem item: Item)
}

class ItemCollectionManager: NSObject {
	var itemSections: [ItemSection] = []
	var delegate: ItemCollectionManagerProtocol?
}

extension ItemCollectionManager: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return itemSections.count
	}
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return itemSections[section].items.count
	}
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
		if let itemCell = cell as? ItemCollectionViewCell {
			itemCell.configure(item: itemSections[indexPath.section].items[indexPath.row])
			//itemCell.delegate = self
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ItemCollectionHeader", for: indexPath)
		if let headerView = reusableView as? ItemCollectionHeaderReusableView {
			headerView.titleLabel.text = itemSections[indexPath.section].name
		}
		return reusableView
	}
}

extension ItemCollectionManager: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let item = itemSections[indexPath.section].items[indexPath.row]
		delegate?.manager(collectionManager: self, didSelectItem: item)
	}
}

extension ItemCollectionManager: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let totalWidth = collectionView.frame.size.width - 20.0
		return CGSize(width: totalWidth / 2.0, height: 200.0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		guard !itemSections[section].name.isEmpty else {
			return CGSize.zero
		}
		return CGSize(width: collectionView.frame.size.width, height: 60.0)
	}
}

//extension ItemCollectionManager: {
//	
//}
