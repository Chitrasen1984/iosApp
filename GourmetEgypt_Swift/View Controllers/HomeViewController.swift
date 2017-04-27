//
//  ViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 25/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit
@objc
protocol CenterViewControllerDelegate {
    @objc optional func toggleLeftPanel()
    @objc optional func toggleRightPanel()
    @objc optional func collapseSidePanels()
}

class HomeViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var homeSearchBar: UISearchBar!
   
    var delegate: CenterViewControllerDelegate?
    
    //MARK: View Controller Life Cycle Methods:-
    override func viewDidLoad() {
        super.viewDidLoad()
        let companyImageLogo = UIImageView(image: UIImage(named: "CompanyLogo")!)
        self.navigationItem.titleView = companyImageLogo
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
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
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "homeCell"
        let cell = homeTableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HomeTableViewCell!
        // Make sure you have this code
        //        cell.delegate = self;
        if indexPath.row==0 {
            cell?.bannerType2.isHidden = true;
            cell?.bannerType1.isHidden = false;
        }
        else {
            cell?.bannerType1.isHidden = true;
            cell?.bannerType2.isHidden = false;
        }
        
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        return cell!
    }

}



