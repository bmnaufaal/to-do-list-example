//
//  ViewController.swift
//  ToDoList
//
//  Created by Berlian on 16/06/22.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableView
        cell?.titleLabel.text  = model.title
        cell?.subtitleLabel.text  = model.subtitle
        return cell!
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                // delete the item here
                let item = self.models[indexPath.row]
                self.deleteItem(item: item)
                tableView.reloadData()
                completionHandler(true)
            }
            deleteAction.image = UIImage(systemName: "trash")
            deleteAction.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
            return configuration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTask" {
          // .. do somtheing
        } else if segue.identifier == "editTask" {
            if let destination = segue.destination as? DetailTaskController {
                destination.model = models[(tableView.indexPathForSelectedRow?.row)!]
            }
        }
    }
    
//    Core Data
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        } catch {
//            Error
        }
    }
    
    func createItem(title: String, subtitle: String, desc: String) {
        let newItem = ToDoListItem(context: context)
        newItem.title = title
        newItem.subtitle = subtitle
        newItem.desc = desc
        
        do {
            try context.save()
        } catch {
//            Error
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        } catch {
//            Error
        }
    }
    
    func updateItem(item: ToDoListItem, newTitle: String, newSubTitle: String, newDesc: String) {
        item.title = newTitle
        item.subtitle = newSubTitle
        item.desc = newDesc
        
        do {
            try context.save()
        } catch {
//            Error
        }
    }


}

