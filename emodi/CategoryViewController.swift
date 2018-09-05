//
//  CategoryViewController.swift
//  emodi
//
//  Created by 박기찬 on 2018. 8. 20..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

protocol CategoryViewControllerDelegate {
    func updateFlag()
}

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WriteViewControllerDelegate {
    var cateArray : [Dictionary<String, AnyObject>] = Array()
    var emoTag :Int = 0
    var flag : Bool = false
    var delegate: CategoryViewControllerDelegate?
    @IBOutlet weak var categoryTableview: UITableView!
    
    override func viewDidLoad() {
        
        var dict : Dictionary<String, AnyObject> = Dictionary()
        dict["idx"] = 0 as AnyObject
        dict["title"] = "연애" as AnyObject
        cateArray.append(dict)
        
        dict["idx"] = 1 as AnyObject
        dict["title"] = "학업" as AnyObject
        cateArray.append(dict)
        
        dict["idx"] = 2 as AnyObject
        dict["title"] = "연애" as AnyObject
        cateArray.append(dict)
        
        dict["idx"] = 3 as AnyObject
        dict["title"] = "가족" as AnyObject
        cateArray.append(dict)
        
        dict["idx"] = 4 as AnyObject
        dict["title"] = "친구" as AnyObject
        cateArray.append(dict)
        
        dict["idx"] = 5 as AnyObject
        dict["title"] = "금전" as AnyObject
        cateArray.append(dict)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.flag {
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cateArray.count
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell : CategoryCell = categoryTableview.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let dict : Dictionary = self.cateArray[indexPath.row]
        let str : String = dict["title"] as! String
        cell.categoryBtn.setTitle(str ,for: .normal)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "WriteViewController") as! WriteViewController
        vc.setCateTag(indexPath.row , emoTag)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func setTag(_ tag : Int){
        self.emoTag = tag;
    }
    
    func updateFlag() {
        self.flag = true
        self.delegate?.updateFlag()
    }
}
