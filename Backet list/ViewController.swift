//
//  ViewController.swift
//  Backet list
//
//  Created by admin on 27/12/2021.
//

import UIKit


class ViewController: UITableViewController, cancelbtn{
    func cancelbtn(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var ArrName:[Task]=[]
    
    func savebtn(by controller: UIViewController,with text:String,at indexpath:NSIndexPath?) {
        if let index = indexpath {
                    updateTask(index.row,text)
                }else{
                    addTask(text)
                }
                dismiss(animated: true, completion: nil)
    }
    func addTask(_ text:String){
           TaskModel.addTask(objective: text, completionHandler: {
               data, response, error in
               do{
                   let result = try JSONDecoder().decode([Task].self, from: data!)
                   
                   DispatchQueue.main.async {
                       self.ArrName = result
                       self.tableView.reloadData()
                   }
               }catch{
                   print(error)
               }
           })
       }
       
       func updateTask(_ index:Int,_ text:String){
           TaskModel.updateTask(index: index, objective: text, completionHandler: {
               data, response, error in
               do{
                   let result = try JSONDecoder().decode([Task].self, from: data!)
                   
                   DispatchQueue.main.async {
                       self.ArrName = result
                       self.tableView.reloadData()
                   }
               }catch{
                   print(error)
               }
           })}
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            TaskModel.getAllTasks(completionHandler: {
                data, response, error in
                
                do{
                    self.ArrName = try JSONDecoder().decode([Task].self, from: data!)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch{
                    print(error)
                }
            })
            
            
        }
            
                                  
                                  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                     let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                         cell.textLabel?.text=ArrName[indexPath.row].objective
        return cell
    }
        //////////////////////////////////////////////////////// ///////////////        ///////////////// ///               /////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                 TaskModel.deleteTask(index: ArrName[indexPath.row].id, completionHandler: {
                                                    data, response, error in
                                                    do{
                                                        let result = try JSONDecoder().decode([Task].self, from: data!)
                                                        
                                                        DispatchQueue.main.async {
                                                            self.ArrName = result
                                                            self.tableView.reloadData()
                                                        }
                                                    }catch{
                                                        print(error)
                                                    }
                                                    
                                                })
            }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "editcell", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {

                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController
            
            controller.delegate = self
        }else if sender is IndexPath {
            
                        let navigationController = segue.destination as! UINavigationController
                        let controller = navigationController.topViewController as! SecondTableViewController

            controller.delegate = self
                        let indexPath = sender as! NSIndexPath
            let editing=ArrName[indexPath.row].objective
            controller.edittext=editing
            controller.indexPath=indexPath
        } }
    
    }
                                  

    
