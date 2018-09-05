//
//  DetailViewController.swift
//  emodi
//
//  Created by 박기찬 on 2018. 8. 26..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var contentViewWidthConstraints: NSLayoutConstraint!
    @IBOutlet weak var labelViewHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeightConstraints: NSLayoutConstraint!
    
    var colorTag : Int = 0;
    var cateTag : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setContent();
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContent() {
        
        self.labelViewHeightConstraints.constant = 100.0;
        self.tableViewHeightConstraints.constant = 0.0;
        self.contentViewHeightConstraints.constant = 300.0 + self.labelViewHeightConstraints.constant + self.tableViewHeightConstraints.constant ;
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        self.contentViewWidthConstraints.constant = screenWidth;
        var size: CGSize = self.contentView.frame.size;
        size.width = self.contentViewWidthConstraints.constant;
        size.height = self.contentViewHeightConstraints.constant
        self.scrollView.contentSize = size;
        
        
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
