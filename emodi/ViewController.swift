//
//  ViewController.swift
//  emodi
//
//  Created by 박기찬 on 2018. 8. 12..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, EmotionViewControllerDelegate {

    @IBOutlet weak var option: UIButton!
    @IBOutlet weak var tableview: UITableView!
    var flag : Bool = false
    
    @IBAction func optionBtnClicked(_ sender: Any) {
        let dialog = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "전체 고민", style: UIAlertActionStyle.default){ (action: UIAlertAction) -> Void in
            self.option.setTitle("전체 고민", for: .normal)
            
        }
        let action2 = UIAlertAction(title: "내 고민", style: UIAlertActionStyle.default){ (action: UIAlertAction) -> Void in
            self.option.setTitle("내 고민", for: .normal)
        }
        let action3 = UIAlertAction(title: "댓글 단 고민", style: UIAlertActionStyle.default){ (action: UIAlertAction) -> Void in
            self.option.setTitle("댓글 단 고민", for: .normal)
        }
        let action4 = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel)
        
        dialog.addAction(action1)
        dialog.addAction(action2)
        dialog.addAction(action3)
        dialog.addAction(action4)
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let deviceID = UIDevice.current.identifierForVendor?.uuidString
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.flag{
            self.flag = false
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 70
        }
        else{
            return 158
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell : TopTableCell = tableView.dequeueReusableCell(withIdentifier: "TopTableCell", for: indexPath) as! TopTableCell
            return cell
        }else{
            let cell: EmotionTableCell = tableView.dequeueReusableCell(withIdentifier: "EmotionTableCell", for: indexPath) as! EmotionTableCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if(indexPath.row == 0){
           /* let vc = CategoryViewController()
            self.present(vc, animated: true, completion: nil) */
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    @IBAction func startWriteClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EmotionViewController") as! EmotionViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func updateFlag() {
        self.flag = true
    }
    
}

