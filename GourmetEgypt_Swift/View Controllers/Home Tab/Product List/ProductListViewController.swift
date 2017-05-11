//
//  ProductListViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    var detailItem:Any?
    let subCategoryManager: SubCategoryCollectionManager = SubCategoryCollectionManager()
    let itemCollectionManager: ItemCollectionManager = ItemCollectionManager()
    
    @IBOutlet weak var categoriesView: UIView!
    @IBOutlet weak var subCategoryCollectionView: UICollectionView!
    @IBOutlet weak var itemCollectionView: UICollectionView!
    
    //MARK: ViewController LifeCycle Methods:-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationItem.title = "Meat and Seafood(100+)"
        
        let navigationTitleFont = UIFont(name: "HelveticaNeue-Medium", size: 15)!
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: navigationTitleFont]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Cart"), style: .plain, target: self, action: #selector(cartButtonTapped))
        self.navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsetsMake(10, 21, 6, 1)
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "Back"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "SearchBar"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -8, bottom: 0, right: 8)
        btn2.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
       
        //To add space to left
        let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -18;
        
        self.navigationItem.setLeftBarButtonItems([negativeSpacer, item1, item2], animated: true)
        
        self.categoriesView.layer.shadowOffset = CGSize(width: 1, height: 2);
        self.categoriesView.layer.shadowColor = UIColor.darkGray.cgColor
        self.categoriesView.layer.shadowRadius = 5;
        self.categoriesView.layer.shadowOpacity = 0.25;
        self.categoriesView.clipsToBounds = false
        self.categoriesView.layer.masksToBounds = false
        
        self.edgesForExtendedLayout = [.top]
        configureItemCollectionView()
        configureSubCategoryCollectionView()
    }
    
    func configureItemCollectionView() {
        let nib = UINib(nibName: ItemCollectionViewCell.nibName, bundle: Bundle.main)
        itemCollectionView.register(nib, forCellWithReuseIdentifier: ItemCollectionViewCell.cellIdentifier)
        let headerNib = UINib(nibName: ItemCollectionHeaderReusableView.nibName, bundle: Bundle.main)
        itemCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: ItemCollectionHeaderReusableView.reuseIdentifier)
        
        itemCollectionView.dataSource = itemCollectionManager
        itemCollectionView.delegate = itemCollectionManager
        let items = [ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00"),
            ProductListModel(id: "1", title: "South African Angus Veel Rump Cap Roast", isFavourite: false, imagePath: "", price: "EGP 184.00")]
        let popularSection = ItemSection(name: "Most Popular", items: items)
        let weeklySection = ItemSection(name: "Weekly", items: items)
        let monthlySection = ItemSection(name: "Monthly", items: items)
        
        itemCollectionManager.itemSections = [popularSection, weeklySection, monthlySection]
        itemCollectionManager.delegate = self
        itemCollectionView.reloadData()
    }
    
    func configureSubCategoryCollectionView() {
        let nib = UINib(nibName: SubCategoryCollectionViewCell.nibName, bundle: Bundle.main)
        subCategoryCollectionView.register(nib, forCellWithReuseIdentifier: SubCategoryCollectionViewCell.cellIdentifier)
        subCategoryCollectionView.dataSource = subCategoryManager
        subCategoryCollectionView.delegate = subCategoryManager
        subCategoryManager.categories = [CategoryModel(id: "1", title: "All", imagePath: "www.google.com", subCategories: []),CategoryModel(id: "2", title: "Beef", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "3", title: "Beef & Veel", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "4", title: "Poultry", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "5", title: "Lamb", imagePath: "www.google.com", subCategories: []),
            CategoryModel(id: "6", title: "Frozen", imagePath: "www.google.com", subCategories: [])]
        //["All", "Beef", "Beef & Veel", "Poultry", "Lamb", "Frozen"]
        subCategoryCollectionView.reloadData()
        subCategoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .bottom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "ProductDetailSegue":
            if let vc = segue.destination as? ProductDetailsViewController {
                vc.item = sender as? ProductListModel
            }
        default:
            super.prepare(for: segue, sender: nil)
        }
    }
    
    //MARK: IBAction Methods:-
    
    func cartButtonTapped() {
        
    }
    
    func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func searchButtonPressed() {
        
    }


}
extension ProductListViewController: ItemCollectionManagerProtocol {
    func manager(collectionManager: ItemCollectionManager, didSelectItem item: ProductListModel) {
//        performSegue(withIdentifier: "ProductDetailSegue", sender: item)
        let vc = ProductDetailViewController(nibName: ProductDetailViewController.nibName, bundle: nil)
        vc.productListObj = item as ProductListModel
        self.navigationController?.pushViewController(vc, animated: true );
    }
}

