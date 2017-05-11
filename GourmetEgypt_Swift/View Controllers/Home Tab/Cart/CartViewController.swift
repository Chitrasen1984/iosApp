//
//  CartViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 09/05/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkOutAmountLabel: UILabel!
    @IBOutlet weak var totalItemNotificationLabel: UILabel!
    @IBOutlet weak var deliveryLocationLabel: UILabel!
    @IBOutlet weak var totalItemsInCartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CartTableViewCell", bundle: Bundle.main)
        self.cartTableView.register(nib, forCellReuseIdentifier: NodeTableViewCell.cellIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func checkOutButtonTapped(_ sender: Any) {
    }
    

}
