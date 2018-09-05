//
//  EmotionViewController.swift
//  emodi
//
//  Created by 박기찬 on 2018. 8. 20..
//  Copyright © 2018년 박기찬. All rights reserved.
//

import UIKit

protocol EmotionViewControllerDelegate {
    func updateFlag()
}

class EmotionViewController: UIViewController, CategoryViewControllerDelegate {
    var flag : Bool = false
    var delegate : EmotionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.flag{
            self.dismiss(animated: false, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emotionClicked(_ sender:UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        vc.setTag(sender.tag)
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func updateFlag() {
        self.flag = true
        self.delegate?.updateFlag()
    }
    
}
