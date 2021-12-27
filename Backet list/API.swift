//
//  API.swift
//  Backet list
//
//  Created by admin on 27/12/2021.
//

import Foundation


class TaskModel {
    //https://saudibucketlistapi.herokuapp.com/tasks/
    //request http://localhost:8000/tasks
    static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void){
           let url = URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/")
           let task = URLSession.shared.dataTask(with: url!, completionHandler: completionHandler)
           task.resume()
       }
       
       static func addTask(objective:String, completionHandler: @escaping(_ data: Data?, _ response:URLResponse?, _ error:Error?) -> Void){
           
           var request = URLRequest(url: URL(string:"https://saudibucketlistapi.herokuapp.com/tasks/")!)
           request.httpMethod = "POST"
           let bodyData = "objective=\(objective)"
           request.httpBody = bodyData.data(using: .utf8)
           
           URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
       }
       
       static func deleteTask(index:Int, completionHandler: @escaping(_ data: Data?, _ response:URLResponse?, _ error:Error?) -> Void){
           var request = URLRequest(url: URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/\(index)")!)
           request.httpMethod = "DELETE"
           URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
       }
       
       static func updateTask(index:Int,objective:String,completionHandler: @escaping(_ data: Data?, _ response:URLResponse?, _ error:Error?) -> Void){
           var request = URLRequest(url: URL(string: "https://saudibucketlistapi.herokuapp.com/tasks/\(index)")!)
           request.httpMethod = "PATCH"
           let bodyObj = ["objective": objective]
           do{
               request.httpBody = try JSONSerialization.data(withJSONObject: bodyObj)
           }catch{
               print(error)
           }
           request.addValue("application/json", forHTTPHeaderField: "Content-Type")
           URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
       }
   }

