//
//  CategoryViewController.swift
//  GourmetEgypt_Swift
//
//  Created by Ashutosh Mishra on 26/04/17.
//  Copyright © 2017 Ashutosh Mishra. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {//,UIGestureRecognizerDelegate
    var detailItem:Any?
    @IBOutlet private weak var detailDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        
//        if gestureRecognizer.isMember(of: UITapGestureRecognizer.self) {
//            return true
//        }
//        else if gestureRecognizer.isMember(of: UISwipeGestureRecognizer.self) {
//            return false
//        }
//        return true;
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
