//
//  CodableTask.swift
//  Backet list
//
//  Created by admin on 27/12/2021.
//

import Foundation

struct Task:Codable {
    var id:Int
    var objective:String
    var created_at:String
}
