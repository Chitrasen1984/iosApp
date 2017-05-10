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
	var items: [ProductListModel]
}

protocol ItemCollectionManagerProtocol {
	func manager(collectionManager: ItemCollectionManager, didSelectItem item: ProductListModel)
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
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(0, 7, 0, 7)
        let width = UIScreen.main.bounds.size.width - 21
        flow.itemSize = CGSize(width: width/2, height: 200.0)
        flow.minimumInteritemSpacing = 7
        flow.minimumLineSpacing = 7
        return flow.itemSize

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
