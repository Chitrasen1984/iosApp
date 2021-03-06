//
//  HomeViewController1.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit
@objc
//protocol CenterViewControllerDelegate {
//    @objc optional func toggleLeftPanel()
//    @objc optional func collapseSidePanels()
//}

class HomeViewController1: UIViewController, UITableViewDataSource {
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var companyLogoImageView: UIImageView!
    @IBOutlet weak var headerView: UIView!
    
    var delegate: CenterViewControllerDelegate?
    var arrOfBanners: [BannerModel] = []
    
    //MARK: View Controller Life Cycle Methods:-
    override func viewDidLoad() {
        super.viewDidLoad()
        let companyImageLogo = UIImageView(image: UIImage(named: "CompanyLogo")!)
        self.navigationItem.titleView = companyImageLogo
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        for i in 0..<10 {
            let bannerObj:BannerModel = BannerModel(id: "\(i)", title: "Banner1", bannerDescription: "Banner1", imagePath: "www.google.com", bannerType: "1")
            arrOfBanners.append(bannerObj)
        }
        
        print(arrOfBanners)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Custom methods and IBActions
    func handleTap() {
        self.homeSearchBar.resignFirstResponder()
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
    }
    @IBAction func sliderButtonTapped(_ sender: Any) {
        self.delegate?.toggleLeftPanel!()
        
    }
    
    //MARK: UITableView Data source and Delegate Methods:-
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfBanners.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "homeCell"
        let cell = homeTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HomeTableViewCell!
        cell?.configure(with: arrOfBanners[indexPath.row], indexPath: indexPath as NSIndexPath)
        return cell!
    }
    
}
