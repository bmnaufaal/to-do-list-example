//
//  NewTaskController.swift
//  ToDoList
//
//  Created by Berlian on 16/06/22.
//

import UIKit

class NewTaskController: UIViewController {
    
    var table = ViewController()
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var subtitleField: UITextField!
    @IBOutlet weak var descField: UITextView!
    
    @IBAction func submit(_ sender: Any) {
        if(titleField.text == "" || subtitleField.text == "" || descField.text == "") {
            // Create new Alert
            let dialogMessage = UIAlertController(title: "Alert", message: "Invalid input", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            table.createItem(title: titleField.text!, subtitle: subtitleField.text!, desc: descField.text!)
            navigationController?.popViewController(animated: true)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
