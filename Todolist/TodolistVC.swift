//
//  TodolistVC.swift
//  Todolist
//
//  Created by Phongsuphat Sanwong on 29/12/2561 BE.
//  Copyright © 2561 Phongsuphat Sanwong. All rights reserved.
//

import UIKit
import CoreData

class TodolistVC: UITableViewController {
    
    var itemArray = ["Luffy","Zoro","Sanji"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Todoitemcell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        let alert = UIAlertController(title: "Add a new list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add now", style: .default) { (action) in
            //What will happen when button was pressed
            self.itemArray.append(textfield.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new list"
            textfield = alertTextfield
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}




