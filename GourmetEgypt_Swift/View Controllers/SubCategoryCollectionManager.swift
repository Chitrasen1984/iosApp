//
//  SubCategoryCollectionManager.swift
//  GourmetEgypt_Swift
//
//  Created by Susmita Horrow on 29/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import Foundation
import UIKit

class SubCategoryCollectionManager: NSObject {
    var categories: [String] = []
}

extension SubCategoryCollectionManager: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCell", for: indexPath)
        if let subCategoryCell = cell as? SubCategoryCollectionViewCell {
            subCategoryCell.configure(category: categories[indexPath.row])
        }
        return cell
    }
}

extension SubCategoryCollectionManager: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let cell = collectionView.cellForItem(at: indexPath) as? SubCategoryCollectionViewCell {
			cell.isSelected = !cell.isSelected
		}
	}
}

extension SubCategoryCollectionManager: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let category = categories[indexPath.row]
//        let label = UILabel()
//        label.text = category
//        let size = label.sizeThatFits(CGSize(width: 100.0, height: 50.0))
        return CGSize(width: 100.0, height: 50.0)
    }
}
