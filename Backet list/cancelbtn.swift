//
//  cancelbtn.swift
//  Backet list
//
//  Created by admin on 27/12/2021.
//

import Foundation
import UIKit
protocol cancelbtn:class{
    
    func cancelbtn(by controller:UIViewController)
    func savebtn(by controller:UIViewController,with  text:String,at indexpath:NSIndexPath?)
}
