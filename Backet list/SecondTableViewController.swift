//
//  SecondTableViewController.swift
//  Backet list
//
//  Created by admin on 27/12/2021.
//

import UIKit

class SecondTableViewController: UITableViewController {
  
    var indexPath:NSIndexPath?
    var edittext:String?
    @IBOutlet weak var textfield: UITextField!
    weak var delegate: cancelbtn?
    @IBAction func savebtn(_ sender: UIBarButtonItem) {
        let text=textfield.text!
        delegate?.savebtn(by: self,with:text,at:indexPath)
    }
    @IBAction func cancelbtn(_ sender:  UIBarButtonItem) {
        delegate?.cancelbtn(by: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text=edittext

    }
    override func didReceiveMemoryWarning() {
        
    }
}

