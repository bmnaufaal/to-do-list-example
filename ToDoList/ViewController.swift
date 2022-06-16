//
//  ViewController.swift
//  ToDoList
//
//  Created by Berlian on 16/06/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //    var tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        return table
//    }()
    
    private var models = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
//        view.addSubview(tableView)
//        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.frame = view.bounds
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
//    @objc private func didTapAdd() {
//        let alert = UIAlertController(
//            title: "New Item", message: "Enter new item", preferredStyle: .alert
//        )
//        alert.addTextField(configurationHandler: nil)
//        alert.addAction(UIAlertAction(
//            title: "Submit",
//            style: .cancel,
//            handler: {
//                [weak self] _ in
//                guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
//                    return
//                }
//            self?.createItem(
//                title: text,
//                subtitle: "a",
//                desc: "a"
//            )
//        }))
//        present(alert, animated: true)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAllItems()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableView
//        cell.textLabel?.text = model.title
        cell?.titleLabel.text  = model.title
        cell?.subtitleLabel.text  = model.subtitle
        return cell!
    }
    
//    Core Data
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
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
            getAllItems()
        } catch {
//            Error
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            try context.save()
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

