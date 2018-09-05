//
//  WriteViewController.swift
//  emodi
//
//  Created by 박기찬 on 2018. 8. 26..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

protocol WriteViewControllerDelegate {
    func updateFlag()
}

class WriteViewController: UIViewController {
    
    @IBOutlet weak var emoView: UIView!
    var colorTag : Int = 0
    var cateTag : Int = 0
    var emoTag : Int = 0
    var delegate: WriteViewControllerDelegate?
    
    var flag : Bool = false
    
    @IBOutlet weak var context: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCateTag(_ i : Int , _ j : Int){
        cateTag = i
        emoTag = j
    }
    
    @IBAction func colorClicked(_ sender: UIButton) {
        colorTag = sender.tag
        if colorTag == 0{
           emoView.backgroundColor = UIColor(red: 223/255.0, green: 50/255.0, blue: 11/255.0, alpha: 1.0)
        }
        else if colorTag == 1{
            emoView.backgroundColor = UIColor(red: 234/255.0, green: 149/255.0, blue: 58/255.0, alpha: 1.0)
        }
        else if colorTag == 2{
            emoView.backgroundColor = UIColor(red: 242/255.0, green: 238/255.0, blue: 20/255.0, alpha: 1.0)
        }
        else if colorTag == 3{
            emoView.backgroundColor = UIColor(red: 85/255.0, green: 85/255.0, blue: 85/255.0, alpha: 1.0)
        }
        else if colorTag == 4{
            emoView.backgroundColor = UIColor(red: 121/255.0, green: 17/255.0, blue: 190/255.0, alpha: 1.0)
        }
        else if colorTag == 5{
            emoView.backgroundColor = UIColor(red: 71/255.0, green: 151/255.0, blue: 224/255.0, alpha: 1.0)
        }
        else if colorTag == 6{
            emoView.backgroundColor = UIColor(red: 57/255.0, green: 221/255.0, blue: 74/255.0, alpha: 1.0)
        }
        
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        var Dict : Dictionary<String , AnyObject> = [:]
        Dict["CateTag"] = self.cateTag as AnyObject
        Dict["EmoTag"] = self.emoTag as AnyObject
        Dict["EmoColor"] = self.colorTag as AnyObject
        Dict["Context"] = self.context.text as AnyObject
        
        self.delegate?.updateFlag()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
